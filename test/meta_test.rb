# frozen_string_literal: true

require_relative 'test_helper'

class MetaIpRanges
  include Legitbot::MetaIpRanges
end

class MetaTest < Minitest::Test
  def test_fetch_ips
    # NOTE: network call
    ip_ranges = MetaIpRanges.new.fetch_ip_ranges_orig

    refute_nil ip_ranges
    assert_kind_of Array, ip_ranges
    refute_empty ip_ranges
  end

  def test_valid_ip
    ip = '69.63.186.89'
    match = Legitbot::Meta.new(ip)

    assert_predicate match, :valid?

    ip = '69.171.251.1'
    match = Legitbot::Meta.new(ip)

    assert_predicate match, :valid?
  end

  def test_invalid_ip
    ip = '127.0.0.1'
    match = Legitbot::Meta.new(ip)

    assert_predicate match, :fake?
  end

  def test_user_agent1
    Legitbot.bot(
      'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)',
      '31.13.76.56'
    ) do |bot|
      assert_equal :meta, bot.detected_as
      assert_predicate bot, :valid?
    end
  end

  def test_user_agent2
    Legitbot.bot(
      'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)',
      '173.252.87.8'
    ) do |bot|
      assert_equal :meta, bot.detected_as
      assert_predicate bot, :valid?
    end
  end

  def test_user_agent3
    Legitbot.bot(
      'meta-externalfetcher/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)',
      '173.252.87.8'
    ) do |bot|
      assert_equal :meta, bot.detected_as
      assert_predicate bot, :valid?
    end
  end

  # rubocop:disable Layout/LineLength
  def test_user_agent4
    Legitbot.bot(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 meta-externalagent/1.1 Twitterbot/1.0',
      '92.243.181.7'
    ) do |bot|
      assert_includes %i[meta twitter], bot.detected_as
      assert_predicate bot, :fake?
    end
  end
  # rubocop:enable Layout/LineLength
end
