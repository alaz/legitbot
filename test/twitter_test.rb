# frozen_string_literal: true

require_relative 'test_helper'

class TwitterTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Twitter.new ip
    refute_predicate match, :valid?
  end

  def test_valid_ip
    ip = '199.16.156.125'
    match = Legitbot::Twitter.new ip
    assert_predicate match, :valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Twitterbot/1.0',
      '149.210.164.47'
    )
    assert bot
    refute_predicate bot, :valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Twitterbot/1.0',
      '199.16.156.125'
    )
    assert bot
    assert_predicate bot, :valid?
  end
end
