require 'minitest/autorun'
require 'legitbot'

class PinterestTest < Minitest::Test
  def test_malicious_ip
    ip = "149.210.164.47"
    match = Legitbot::Pinterest.new ip
    reverse_name = match.reverse_name
    assert !match.subdomain_of?("pinterest.com."), msg: "#{reverse_name} is not a subdomain of pinterest.com"
    assert !match.valid?, msg: "#{ip} is not a real Pinterest IP"
  end

  def test_valid_ip
    ip = "54.236.1.11"
    match = Legitbot::Pinterest.new ip
    reverse_name = match.reverse_name
    assert match.subdomain_of?("pinterest.com."), msg: "#{reverse_name} is a subdomain of pinterest.com"
    assert match.valid?, msg: "#{ip} is a valid Pinterest IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)", "149.210.164.47")
    assert bot, msg: "Pinterest detected from User-Agent"
    assert !bot.valid?, msg: "Not a valid Pinterest"
  end

  def test_valid_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)", "54.236.1.11")
    assert bot, msg: "Pinterest detected from User-Agent"
    assert bot.valid?, msg: "Valid Pinterest"
  end

  def test_engine_name
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Pinterestbot/1.0; +https://www.pinterest.com/bot.html)", "54.236.1.11")
    assert_equal "Pinterest", bot.detected_as
  end
end
