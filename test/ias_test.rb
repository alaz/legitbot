# frozen_string_literal: true

require_relative 'test_helper'

class IasTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Ias.new ip

    refute_predicate match, :valid?
  end

  def test_valid_ip
    ip = '18.214.43.70'
    match = Legitbot::Ias.new ip

    assert_predicate match, :valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'IAS Crawler (ias_crawler; http://integralads.com/site-indexing-policy/)',
      '18.214.43.72'
    )

    assert bot
    refute_predicate bot, :valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'IAS Crawler (ias_crawler; http://integralads.com/site-indexing-policy/)',
      '18.214.43.70'
    )

    assert bot
    assert_predicate bot, :valid?
  end
end
