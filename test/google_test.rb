require 'minitest/autorun'
require 'legitbot'

class GoogleTest < Minitest::Test
  def test_malicious_ip
    ip = "149.210.164.47"
    match = Legitbot::Google.new ip
    reverse_name = match.reverse_name
    assert !match.subdomain_of?("googlebot.com."), msg: "#{reverse_name} is not a subdomain of googlebot.com"
    assert !match.valid?, msg: "#{ip} is not a real Googlebot IP"
  end

  def test_valid_ip
    ip = "66.249.78.6"
    match = Legitbot::Google.new ip
    reverse_name = match.reverse_name
    assert match.subdomain_of?("googlebot.com."), msg: "#{reverse_name} is a subdomain of googlebot.com"
    assert match.valid?, msg: "#{ip} is a valid Googlebot IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)", "149.210.164.47")
    assert bot, msg: "Googlebot detected from User-Agent"
    assert !bot.valid?, msg: "Not a valid Googlebot"
  end

  def test_valid_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)", "66.249.78.6")
    assert bot, msg: "Googlebot detected from User-Agent"
    assert bot.valid?, msg: "Valid Googlebot"
  end

  def test_engine_name
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)", "66.249.78.6")
    assert_equal "Google", bot.detected_as
  end
end
