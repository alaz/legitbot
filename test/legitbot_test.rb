require 'minitest/autorun'
require 'legitbot'

class LegitbotTest < Minitest::Test
  def test_rules
    assert !Legitbot.bot("Firefox", "127.0.0.1"), msg: "Not a bot"

    Legitbot.bot("Firefox", "127.0.0.1") do |bot|
      flunk "No bot Firefox is possible"
    end
  end
end
