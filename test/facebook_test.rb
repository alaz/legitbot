require 'minitest/autorun'
require 'legitbot'

class FacebookTest < Minitest::Test
  def test_valid_ip
    ip = "69.63.186.89"
    match = Legitbot::Facebook.new(ip)
    assert match.valid?, msg: "#{ip} is a valid Facebook IP"
  end

  def test_invalid_ip
    ip = "127.0.0.1"
    match = Legitbot::Facebook.new(ip)
    assert match.fake?, msg: "#{ip} is a fake Facebook IP"
  end

  def test_user_agent
    bot = Legitbot.bot("facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)", "31.13.76.56")
    assert_equal "Facebook", bot.detected_as
    assert bot.valid?, msg: "A valid Facebook User-agent and IP"
  end
end
