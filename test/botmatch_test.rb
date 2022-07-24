# frozen_string_literal: true

require_relative 'test_helper'

class BotMatchTest < Minitest::Test
  include Minitest::Hooks
  include DnsServerMock

  def test_valid_class_syntax
    assert Legitbot::Google.valid?('66.249.64.141')
    assert Legitbot::Google.fake?('149.210.164.47')
  end
end
