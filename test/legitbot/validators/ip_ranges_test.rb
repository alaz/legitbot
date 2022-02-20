# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

module Legitbot
  # rubocop:disable Minitest/MultipleAssertions
  module Validators
    class NoRanges
      include IpRanges
    end

    class ArrayRanges
      include IpRanges
      ip_ranges '66.220.144.0/21', '2a03:2880:f234::/48'
    end

    class FlattenRanges
      include IpRanges
      ip_ranges %w[66.220.144.0/21 2a03:2880:f234::/48]
    end

    class EmptyRanges
      include IpRanges
      ip_ranges

      def initialize(ip)
        @ip = ip
      end
    end

    class LoadRanges
      include IpRanges

      @i = 0
      ip_ranges do
        @i += 1
        [@i.odd? ? '127.0.0.0/8' : '192.168.0.0/16']
      end

      def self.counter
        @i
      end

      def initialize(ip)
        @ip = ip
      end
    end

    class NilRanges
      include IpRanges
      ip_ranges { nil }
    end

    class Ipv4Ranges
      include IpRanges
      ip_ranges { ['66.220.144.0/21'] }
    end

    class IpRangesTest < Minitest::Test
      def test_partition_method
        empty = NoRanges.partition_ips([])
        assert_empty empty
      end

      def test_ipv6_partition
        ipv6 = NoRanges.partition_ips(['2a03:2880:f234::/48'])
        assert_nil ipv6[:ipv4].top_node
        refute_nil ipv6[:ipv6].top_node
      end

      def test_ipv4_partition
        ipv4 = NoRanges.partition_ips(['66.220.144.0/21'])
        refute_nil ipv4[:ipv4].top_node
        assert_nil ipv4[:ipv6].top_node
      end

      def test_no_ranges
        assert NoRanges.valid_ip?('127.0.0.1')
      end

      def test_empty_matcher
        assert_empty EmptyRanges.valid_ips
        assert_empty EmptyRanges.load_ips
        assert EmptyRanges.valid_ip?('127.0.0.0')
        assert EmptyRanges.valid_ip?('66.220.144.1')
        assert EmptyRanges.valid_ip?('2a03:2880:f234:0:0:0:0:1')

        matcher = EmptyRanges.new '127.0.0.0'
        assert matcher.valid_ip?
      end

      def test_matcher_array
        assert ArrayRanges.valid_ip?('66.220.144.1')
        assert ArrayRanges.valid_ip?('2a03:2880:f234:0:0:0:0:1')
        refute ArrayRanges.valid_ip?('66.220.143.1')
        refute ArrayRanges.valid_ip?('2a03:2880:f233:0:0:0:0:1')
      end

      def test_flatten
        assert FlattenRanges.valid_ip?('66.220.144.1')
        assert FlattenRanges.valid_ip?('2a03:2880:f234:0:0:0:0:1')
        refute FlattenRanges.valid_ip?('66.220.143.1')
        refute FlattenRanges.valid_ip?('2a03:2880:f233:0:0:0:0:1')
      end

      # rubocop:disable Metrics/AbcSize
      def test_matcher_loader
        assert_equal 0, LoadRanges.counter
        assert LoadRanges.new('127.127.127.127').valid_ip?
        refute LoadRanges.new('10.10.10.10').valid_ip?
        refute LoadRanges.new('192.168.127.254').valid_ip?
        assert_equal 1, LoadRanges.counter

        LoadRanges.reload_ips
        refute LoadRanges.new('127.127.127.127').valid_ip?
        refute LoadRanges.new('10.10.10.10').valid_ip?
        assert LoadRanges.new('192.168.127.254').valid_ip?
        assert_equal 2, LoadRanges.counter
      end
      # rubocop:enable Metrics/AbcSize

      def test_nil_ranges
        assert NilRanges.valid_ip?('127.0.0.1')
      end

      def test_ipv4_only_ranges
        refute Ipv4Ranges.valid_ip?('2a03:2880:f234:0:0:0:0:1')
      end
    end
  end
  # rubocop:enable Minitest/MultipleAssertions
end
