# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
require 'legitbot'

class AlexaTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Alexa.new ip
    refute match.valid?
  end

  def test_valid_ip
    ip = '52.86.176.3'
    match = Legitbot::Alexa.new ip
    assert match.valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Alexabot/1.0; +http://www.alexa.com/help/certifyscan; certifyscan@alexa.com)',
      '149.210.164.47'
    )
    assert bot
    refute bot.valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Alexabot/1.0; +http://www.alexa.com/help/certifyscan; certifyscan@alexa.com)',
      '52.86.176.3'
    )
    assert bot
    assert bot.valid?
  end
end
