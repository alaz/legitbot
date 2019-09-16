# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

class BotMatchTest < Minitest::Test
  def test_valid_class_syntax
    assert Legitbot::Google.valid?('66.249.64.141'), msg: 'Valid Googlebot'
    assert Legitbot::Google.fake?('149.210.164.47'), msg: 'Fake Googlebot'
  end
end
