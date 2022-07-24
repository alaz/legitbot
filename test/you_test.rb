# frozen_string_literal: true

require_relative 'test_helper'

class YouTest < Minitest::Test
  def test_malicious_ip
    ip = '20.59.41.22'
    match = Legitbot::You.new ip
    refute_predicate match, :valid?
  end

  def test_valid_ip
    ip = '20.59.40.22'
    match = Legitbot::You.new ip
    assert_predicate match, :valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; YouBot/1.0; +https://about.you.com/youbot/)',
      '20.59.41.22'
    )
    assert bot
    refute_predicate bot, :valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; YouBot/1.0; +https://about.you.com/youbot/)',
      '20.59.40.22'
    )
    assert bot
    assert_predicate bot, :valid?
  end
end
