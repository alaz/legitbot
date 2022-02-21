# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
require 'legitbot'

class AppleTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_valid_ip
    ip = '17.58.98.60'
    match = Legitbot::Apple.new(ip)
    assert match.valid?
  end

  def test_invalid_ip
    ip = '127.0.0.1'
    match = Legitbot::Apple.new(ip)
    assert match.fake?
  end

  # rubocop:disable Layout/LineLength
  def test_user_agent
    bot = Legitbot.bot(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5 (Applebot/0.1; +http://www.apple.com/go/applebot)',
      '17.58.98.60'
    )
    assert_equal :apple, bot.detected_as
    assert bot.valid?
  end
  # rubocop:enable Layout/LineLength
end
