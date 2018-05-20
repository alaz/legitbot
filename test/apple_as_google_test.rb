require 'minitest/autorun'
require 'legitbot'

class AppleAsGoogleTest < Minitest::Test
  def test_valid_ip
    ip = "17.58.98.60"
    match = Legitbot::Apple_as_Google.new(ip)
    assert match.valid?, msg: "#{ip} is a valid Applebot IP"
  end

  def test_invalid_ip
    ip = "127.0.0.1"
    match = Legitbot::Apple_as_Google.new(ip)
    assert match.fake?, msg: "#{ip} is a fake Applebot IP"
  end

  def test_user_agent
    bot = Legitbot.bot("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)", "17.58.98.60")
    assert_equal :apple_as_google, bot.detected_as
    assert bot.valid?, msg: "A valid Applebot User-agent and IP"
  end
end
