# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class LegitbotTest < Minitest::Test
  def test_rules
    assert !Legitbot.bot('Firefox', '127.0.0.1'),
           msg: 'Not a bot'
    assert Legitbot.bot('Googlebot', '5.140.70.64'),
           msg: 'No reverse resolve, bot'

    Legitbot.bot('Firefox', '127.0.0.1') do |_bot|
      flunk 'No bot Firefox is possible'
    end
  end
end
