# frozen_string_literal: true

require_relative 'test_helper'

class BLEXBot < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::BLEXBot.new ip

    refute_predicate match, :valid?
  end

  def test_valid_ip
    ip = '65.21.113.197'
    match = Legitbot::BLEXBot.new ip

    assert_predicate match, :valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; BLEXBot/1.0; +http://webmeup-crawler.com/)',
      '149.210.164.47'
    )

    assert bot
    refute_predicate bot, :valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; BLEXBot/1.0; +http://webmeup-crawler.com/)',
      '65.21.113.197'
    )

    assert bot
    assert_predicate bot, :valid?
  end

  def test_valid_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; BLEXBot/1.0; +http://webmeup-crawler.com/)',
      '65.21.113.197'
    )

    assert_equal :blexbot, bot.detected_as
  end

  def test_fake_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; BLEXBot/1.0; +http://webmeup-crawler.com/)',
      '81.1.172.108'
    )

    assert_equal :blexbot, bot.detected_as
  end
end
