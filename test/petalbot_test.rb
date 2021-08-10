# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class PetalbotTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Petalbot.new ip
    assert !match.valid?, msg: "#{ip} is not a real Petalbot IP"
  end

  def test_valid_ip
    ip = '114.119.128.10'
    match = Legitbot::Petalbot.new ip
    assert match.valid?, msg: "#{ip} is a valid Petalbot IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible;PetalBot; +https://aspiegel.com/petalbot)',
      '149.210.164.47'
    )
    assert bot, msg: 'Petalbot detected from User-Agent'
    assert !bot.valid?, msg: 'Not a valid Petalbot'
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible;PetalBot; +https://aspiegel.com/petalbot)',
      '114.119.128.10'
    )
    assert bot, msg: 'Petalbot detected from User-Agent'
    assert bot.valid?, msg: 'Valid Petalbot'
  end

  def test_valid_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible;PetalBot; +https://aspiegel.com/petalbot)',
      '66.249.64.141'
    )
    assert_equal :petalbot, bot.detected_as
  end

  def test_fake_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; PetalBot/2.1; +http://www.google.com/bot.html)',
      '81.1.172.108'
    )
    assert_equal :petalbot, bot.detected_as
  end
end
