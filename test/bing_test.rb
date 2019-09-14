require 'minitest/autorun'
require 'legitbot'

class BingTest < Minitest::Test
  def test_malicious_ip
    ip = "149.210.164.47"
    match = Legitbot::Bing.new ip
    reverse_name = match.reverse_name
    assert !match.subdomain_of?("search.msn.com."), msg: "#{reverse_name} is not a subdomain of search.msn.com"
    assert !match.valid?, msg: "#{ip} is not a real Bingbot IP"
  end

  def test_valid_ip
    ip = "157.55.39.132"
    match = Legitbot::Bing.new ip
    reverse_name = match.reverse_names.join ', '
    assert match.subdomain_of?("search.msn.com."), msg: "#{reverse_name} is a subdomain of search.msn.net"
    assert match.valid?, msg: "#{ip} is a valid Bingbot IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)", "149.210.164.47")
    assert bot, msg: "Bingbot detected from User-Agent"
    assert !bot.valid?, msg: "Not a valid Bingbot"
  end

  def test_valid_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)", "157.55.39.132")
    assert bot, msg: "Bingbot detected from User-Agent"
    assert bot.valid?, msg: "Valid Bingbot"
  end

  def test_valid_name
    bot = Legitbot.bot("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)", "157.55.39.132")
    assert_equal :bing, bot.detected_as
  end

  def test_fake_name
    bot = Legitbot.bot("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)", "81.1.172.108")
    assert_equal :bing, bot.detected_as
  end
end