# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class ImessageTest < Minitest::Test
  def test_valid_ua
    ua = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) ' \
         'AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 ' \
         'Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0'
    ip = '1.1.1.1'
    bot = Legitbot.bot(ua, ip)
    assert bot.valid?
    assert_equal :imessage, bot.detected_as
  end

  def test_facebook_ua
    ua = 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)'
    ip = '173.252.87.8'
    bot = Legitbot.bot(ua, ip)
    assert bot.valid?
    assert_equal :facebook, bot.detected_as
  end
end
