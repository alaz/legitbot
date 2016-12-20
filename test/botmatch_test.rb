require 'minitest/autorun'
require 'legitbot'

class BotMatchTest < Minitest::Test
  def test_reverse_name
    match = Legitbot::BotMatch.new "66.249.78.6"
    assert_equal "crawl-66-249-78-6.googlebot.com", match.reverse_name
  end

  def test_reverse_ip
    match = Legitbot::BotMatch.new "66.249.78.6"
    assert_equal "66.249.78.6", match.reversed_ip
  end

  def test_reverse_resolves
    match = Legitbot::BotMatch.new "66.249.78.6"
    assert_equal true, match.reverse_resolves?
  end

  def test_valid_class_syntax
    assert Legitbot::Google.valid?("66.249.78.6"), msg: "Valid Googlebot"
    assert Legitbot::Google.fake?("149.210.164.47"), msg: "Fake Googlebot"
  end
end
