# frozen_string_literal: true

require_relative 'test_helper'
require 'minitest/mock'

class MetaLookupTest < Minitest::Test
  AS = Legitbot::MetaIpRanges::AS
  IPV4 = '31.13.24.1'
  IPV6 = '2a03:2880:f810:51::'

  def with_results(*results, &)
    client = Object.new
    client.define_singleton_method(:query) { |*_args, **_kwargs| nil }
    client.define_singleton_method(:perform) { results.length > 1 ? results.shift : results.first }
    Irrc::Client.stub(:new, client, &)
  end

  def matchers
    [Legitbot::Facebook, Legitbot::Meta].map do |base|
      Class.new(base) do
        # Exercise the real loader, bypassing the suite's static route fixture.
        ip_ranges { fetch_ip_ranges_orig }
      end
    end
  end

  def routes
    { AS => { ipv4: { AS => ['31.13.24.0/21'] }, ipv6: { AS => ['2a03:2880::/32'] } } }
  end

  # rubocop:disable-next Minitest/MultipleAssertions
  def test_missing_routes_deny_verification
    [nil, {}, { AS => {} }, { AS => { ipv4: {} } }, { AS => { ipv4: { AS => [] } } }].each do |result|
      with_results(result) do
        matchers.each do |matcher|
          refute_predicate matcher.new(IPV4), :valid?
          refute_predicate matcher.new(IPV6), :valid?
          assert_predicate matcher.new(IPV4), :fake?
          assert_nil matcher.instance_variable_get(:@ip_ranges)
        end
      end
    end
  end

  def test_either_address_family_can_be_missing
    %i[ipv4 ipv6].each do |family|
      with_results(AS => { family => routes[AS][family] }) do
        matchers.each do |matcher|
          assert_equal family == :ipv4, matcher.new(IPV4).valid?
          assert_equal family == :ipv6, matcher.new(IPV6).valid?
          refute_predicate matcher.new('202.119.42.130'), :valid?
        end
      end
    end
  end

  def test_complete_routes_are_cached
    matchers.each do |matcher|
      with_results(routes, {}) do
        assert_predicate matcher.new(IPV4), :valid?
        assert_predicate matcher.new(IPV6), :valid?
        refute_predicate matcher.new('127.0.0.1'), :valid?
      end
    end
  end

  def test_failed_lookup_is_retried
    matchers.each do |matcher|
      with_results({}, routes) do
        refute_predicate matcher.new(IPV6), :valid?
        assert_predicate matcher.new(IPV6), :valid?
      end
    end
  end

  # rubocop:disable-next Minitest/MultipleAssertions
  def test_failed_reload_preserves_cached_routes
    matchers.each do |matcher|
      with_results(routes, {}) do
        assert_predicate matcher.new(IPV6), :valid?
        assert_raises(Legitbot::Validators::IpRanges::Unavailable) { matcher.reload_ips }
        assert_predicate matcher.new(IPV6), :valid?
        refute_predicate matcher.new('127.0.0.1'), :valid?
      end
    end
  end
end
