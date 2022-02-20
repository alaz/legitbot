# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class OracleTest < Minitest::Test
  def test_malicious_ip
    ip = '149.210.164.47'
    match = Legitbot::Oracle.new ip
    refute match.valid?
  end

  def test_valid_ip
    ip = '148.64.56.64'
    match = Legitbot::Oracle.new ip
    assert match.valid?
  end

  def test_malicious_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)',
      '149.210.164.47'
    )
    assert bot
    refute bot.valid?
  end

  def test_valid_ua
    bot = Legitbot.bot(
      'Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)',
      '148.64.56.64'
    )
    assert bot
    assert bot.valid?
  end
end
