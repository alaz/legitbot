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
    Legitbot.bot("facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)", "31.13.76.56") do |bot|
      assert_equal :facebook, bot.detected_as
      assert bot.valid?, msg: "true Facebook"
    end

    Legitbot.bot("facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)", "173.252.87.8") do |bot|
      assert_equal :facebook, bot.detected_as
      assert bot.valid?, msg: "true Facebook"
    end

    Legitbot.bot("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0", "92.243.181.7") do |bot|
      assert_equal :facebook, bot.detected_as
      assert bot.fake?, msg: "fake Facebook"
    end
  end
end
