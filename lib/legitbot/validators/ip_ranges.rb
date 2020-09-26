# frozen_string_literal: true

require 'ipaddr'
require 'interval_tree'

module Legitbot
  module Validators
    #
    # In a bot matcher:
    # `ip_ranges ip, range, ip, ...`
    # `ip_ranges do [ip, range, ...]; end`
    module IpRanges
      class << self
        def included(base)
          base.extend ClassMethods
        end
      end

      def valid_ip?
        self.class.valid_ip?(@ip)
      end

      module ClassMethods # :nodoc:
        FAMILIES = %i[ipv4 ipv6].freeze
        EMPTY_GENERATOR = proc { [] }

        def ip_ranges(*ips, &block)
          @ip_ranges = partition_ips(ips.flatten) unless ips.empty?
          @ip_ranges_loader = block_given? ? block : EMPTY_GENERATOR
          @ip_loader_mutex = Mutex.new
        end

        def check_ranges?
          instance_variable_defined?(:@ip_ranges_loader)
        end

        def valid_ip?(ip)
          return true unless check_ranges?
          return true if valid_ips.empty?

          obj = IPAddr.new(ip)
          ranges = valid_ips[obj.ipv4? ? :ipv4 : :ipv6].search(obj.to_i)
          !ranges.nil? && !ranges.empty?
        end

        def valid_ips
          @ip_loader_mutex.synchronize do
            @ip_ranges ||= load_ips
          end
        end

        def reload_ips
          @ip_loader_mutex.synchronize do
            @ip_ranges = load_ips
          end
        end

        def load_ips
          partition_ips(@ip_ranges_loader.call)
        end

        def partition_ips(ips)
          return [] unless ips&.any?

          ips
            .map { |cidr| IPAddr.new(cidr) }
            .partition(&:ipv4?)
            .each_with_index
            .map do |list, index|
              [FAMILIES[index], build_interval_tree(list)]
            end.to_h
        end

        private

        def build_interval_tree(list)
          ranges = list.map(&:to_range).map do |r|
            (r.begin.to_i..r.end.to_i)
          end
          IntervalTree::Tree.new(ranges)
        end
      end
    end
  end
end
