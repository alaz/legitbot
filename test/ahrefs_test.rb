# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
require 'legitbot'

class AhrefsTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Ahrefs.new ip
    refute match.valid?
  end

  def test_valid_ip
    ip = '54.36.148.0'
    match = Legitbot::Ahrefs.new ip
    assert match.valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)',
      '149.210.164.47'
    )
    assert bot
    refute bot.valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)',
      '54.36.148.0'
    )
    assert bot
    assert bot.valid?
  end
end
