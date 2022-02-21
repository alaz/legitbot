# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
require 'legitbot'

class PinterestTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Pinterest.new ip
    refute match.valid?
  end

  def test_valid_ip
    ip = '54.236.1.11'
    match = Legitbot::Pinterest.new ip
    assert match.valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)',
      '149.210.164.47'
    )
    assert bot
    refute bot.valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)',
      '54.236.1.11'
    )
    assert bot
    assert bot.valid?
  end

  # rubocop:disable Layout/LineLength
  def test_android_not_bot
    bot = Legitbot.bot(
      'Mozilla/5.0 (Linux; Android 8.0.0; SM-G965F Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/70.0.3538.64 Mobile Safari/537.36 [Pinterest/Android]',
      '85.117.106.133'
    )
    assert_nil bot
  end
  # rubocop:enable Layout/LineLength

  def test_engine_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)',
      '54.236.1.11'
    )
    assert_equal :pinterest, bot.detected_as
  end
end
