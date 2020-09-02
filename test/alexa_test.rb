# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class AlexaTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Alexa.new ip
    assert !match.valid?, msg: "#{ip} is not a real Alexa IP"
  end

  def test_valid_ip
    ip = '52.86.176.3'
    match = Legitbot::Alexa.new ip
    assert match.valid?, msg: "#{ip} is a valid Alexa IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Alexabot/1.0; +http://www.alexa.com/help/certifyscan; certifyscan@alexa.com)',
      '149.210.164.47'
    )
    assert bot, msg: 'Alexa detected from User-Agent'
    assert !bot.valid?, msg: 'Not a valid Alexa'
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; Alexabot/1.0; +http://www.alexa.com/help/certifyscan; certifyscan@alexa.com)',
      '52.86.176.3'
    )
    assert bot, msg: 'Alexa detected from User-Agent'
    assert bot.valid?, msg: 'Valid Alexa'
  end
end
