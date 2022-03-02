# frozen_string_literal: true

require 'resolv'
require 'ipaddr'

module Legitbot
  module Validators
    #
    # In a bot matcher:
    # `domains 'search.msn.com', ...`
    # `domains 'googlebot.com', reverse: false`
    #
    # `reverse` is true by default.
    module Domains
      class << self
        def included(base)
          base.extend ClassMethods
        end
      end

      def valid_domain?
        self.class.valid_domain?(@ip)
      end

      module ClassMethods # :nodoc:
        include Legitbot::Config::Resolver

        def domains(*list, reverse: true)
          @valid_domains = list.flatten.map { |d| Resolv::DNS::Name.create(d) }
          @validate_reverse_record = reverse
        end

        def check_domains?
          instance_variable_defined?(:@valid_domains)
        end

        def valid_domain?(ip)
          return true unless check_domains?
          return true if @valid_domains.empty?

          domains = reverse_domains(ip)
          return false if domains.empty?

          record = find_subdomain_record(domains)
          return false unless record
          return true unless @validate_reverse_record

          ip == reverse_ip(record)
        end

        def reverse_domains(ip)
          resolver.getnames(ip)
        rescue Resolv::ResolvError
          nil
        end

        def find_subdomain_record(domains)
          domains.find do |d|
            @valid_domains.any? { |vd| d.subdomain_of?(vd) }
          end
        end

        def reverse_ip(record)
          return nil if record.nil?

          resolver.getaddress(record.to_s).to_s
        rescue Resolv::ResolvError
          nil
        end
      end
    end
  end
end
