# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class PinterestTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Pinterest.new ip
    assert !match.valid?, msg: "#{ip} is not a real Pinterest IP"
  end

  def test_valid_ip
    ip = '54.236.1.11'
    match = Legitbot::Pinterest.new ip
    assert match.valid?, msg: "#{ip} is a valid Pinterest IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)',
      '149.210.164.47'
    )
    assert bot, msg: 'Pinterest detected from User-Agent'
    assert !bot.valid?, msg: 'Not a valid Pinterest'
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)',
      '54.236.1.11'
    )
    assert bot, msg: 'Pinterest detected from User-Agent'
    assert bot.valid?, msg: 'Valid Pinterest'
  end

  # rubocop:disable Metrics/LineLength
  def test_android_not_bot
    bot = Legitbot.bot(
      'Mozilla/5.0 (Linux; Android 8.0.0; SM-G965F Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/70.0.3538.64 Mobile Safari/537.36 [Pinterest/Android]',
      '85.117.106.133'
    )
    assert_nil bot
  end
  # rubocop:enable Metrics/LineLength

  def test_engine_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)',
      '54.236.1.11'
    )
    assert_equal :pinterest, bot.detected_as
  end
end
