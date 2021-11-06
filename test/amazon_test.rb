# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class AmazonTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Amazon.new ip
    assert !match.valid?, msg: "#{ip} is not a real AmazonAdBot IP"
  end

  def test_valid_ip
    ip = '54.166.7.90'
    match = Legitbot::Amazon.new ip
    assert match.valid?, msg: "#{ip} is a valid AmazonAdBot IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AmazonAdBot/1.0; +https://adbot.amazon.com)',
      '149.210.164.47'
    )
    assert bot, msg: 'AmazonAdBot detected from User-Agent'
    assert !bot.valid?, msg: 'Not a valid AmazonAdBot'
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AmazonAdBot/1.0; +https://adbot.amazon.com)',
      '54.166.7.90'
    )
    assert bot, msg: 'AmazonAdBot detected from User-Agent'
    assert bot.valid?, msg: 'Valid AmazonAdBot'
  end

  def test_valid_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AmazonAdBot/1.0; +https://adbot.amazon.com)',
      '54.166.7.90'
    )
    assert_equal :amazon, bot.detected_as
  end

  def test_fake_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AmazonAdBot/1.0; +https://adbot.amazon.com)',
      '81.1.172.108'
    )
    assert_equal :amazon, bot.detected_as
  end
end
