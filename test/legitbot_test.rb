# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class LegitbotTest < Minitest::Test
  def test_rules
    refute Legitbot.bot('Firefox', '127.0.0.1')
    assert Legitbot.bot('Googlebot', '5.140.70.64')

    Legitbot.bot('Firefox', '127.0.0.1') do |_bot|
      flunk 'No bot Firefox is possible'
    end
  end
end
