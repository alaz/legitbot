# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class TwitterTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Twitter.new ip
    assert !match.valid?, msg: "#{ip} is not a real Twitter IP"
  end

  def test_valid_ip
    ip = '199.16.156.125'
    match = Legitbot::Twitter.new ip
    assert match.valid?, msg: "#{ip} is a valid Twitter IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Twitterbot/1.0',
      '149.210.164.47'
    )
    assert bot, msg: 'Twitter detected from User-Agent'
    assert !bot.valid?, msg: 'Not a valid Twitter'
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Twitterbot/1.0',
      '199.16.156.125'
    )
    assert bot, msg: 'Twitter detected from User-Agent'
    assert bot.valid?, msg: 'Valid Twitter'
  end
end
