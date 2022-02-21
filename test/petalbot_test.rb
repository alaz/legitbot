# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
require 'legitbot'

class PetalbotTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Petalbot.new ip
    refute match.valid?
  end

  def test_valid_ip
    ip = '114.119.134.10'
    match = Legitbot::Petalbot.new ip
    assert match.valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible;PetalBot; +https://aspiegel.com/petalbot)',
      '149.210.164.47'
    )
    assert bot
    refute bot.valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible;PetalBot; +https://aspiegel.com/petalbot)',
      '114.119.134.10'
    )
    assert bot
    assert bot.valid?
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
