# frozen_string_literal: true

require_relative 'test_helper'

class AmazonBotTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::AmazonBot.new ip

    refute_predicate match, :valid?
  end

  def test_valid_ip
    ip = '52.70.240.171'
    match = Legitbot::AmazonBot.new ip

    assert_predicate match, :valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; AmazonAdBot/1.0; +https://adbot.amazon.com)',
      '149.210.164.47'
    )

    assert bot
    refute_predicate bot, :valid?
  end

  # rubocop:disable Layout/LineLength
  def test_user_agent
    bot = Legitbot.bot(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML\, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)',
      '52.70.240.171'
    )

    assert bot
    assert_predicate bot, :valid?
  end
  # rubocop:enable Layout/LineLength

  # rubocop:disable Layout/LineLength
  def test_valid_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML\, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)',
      '52.70.240.171'
    )

    assert_equal :amazonbot, bot.detected_as
  end
  # rubocop:enable Layout/LineLength

  # rubocop:disable Layout/LineLength
  def test_fake_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML\, like Gecko) Version/8.0.2 Safari/600.2.5 (Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)',
      '81.1.172.108'
    )

    assert_equal :amazonbot, bot.detected_as
  end
  # rubocop:enable Layout/LineLength
end
