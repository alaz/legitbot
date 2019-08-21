require 'minitest/autorun'
require 'legitbot'

class AhrefsTest < Minitest::Test
  def test_malicious_ip
    ip = "149.210.164.47"
    match = Legitbot::Ahrefs.new ip
    assert !match.valid?, msg: "#{ip} is not a real Ahrefs IP"
  end

  def test_valid_ip
    ip = "54.36.148.0"
    match = Legitbot::Ahrefs.new ip
    assert match.valid?, msg: "#{ip} is a valid Ahrefs IP"
  end

  def test_malicious_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)", "149.210.164.47")
    assert bot, msg: "Ahrefs detected from User-Agent"
    assert !bot.valid?, msg: "Not a valid Ahrefs"
  end

  def test_valid_ua
    bot = Legitbot.bot("Mozilla/5.0 (compatible; AhrefsBot/6.1; +http://ahrefs.com/robot/)", "54.36.148.0")
    assert bot, msg: "Ahrefs detected from User-Agent"
    assert bot.valid?, msg: "Valid Ahrefs"
  end
end
