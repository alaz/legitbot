# frozen_string_literal: true

require_relative 'test_helper'

class DataForSEOTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::DataForSEO.new ip

    refute_predicate match, :valid?
  end

  def test_valid_ip
    ip = '136.243.228.176'
    match = Legitbot::DataForSEO.new ip

    assert_predicate match, :valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; DataForSeoBot; +https://dataforseo.com/dataforseo-bot)',
      '149.210.164.47'
    )

    assert bot
    refute_predicate bot, :valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; DataForSeoBot; +https://dataforseo.com/dataforseo-bot)',
      '136.243.228.176'
    )

    assert bot
    assert_predicate bot, :valid?
  end

  def test_valid_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; DataForSeoBot; +https://dataforseo.com/dataforseo-bot)',
      '136.243.228.176'
    )

    assert_equal :dataforseo, bot.detected_as
  end

  def test_fake_name
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; DataForSeoBot; +https://dataforseo.com/dataforseo-bot)',
      '81.1.172.108'
    )

    assert_equal :dataforseo, bot.detected_as
  end
end
