# frozen_string_literal: true

require 'ipaddr'

module Legitbot # :nodoc:
  # https://support.apple.com/en-us/119829
  class Apple < BotMatch
    domains 'applebot.apple.com.'
  end

  rule Legitbot::Apple, %w[
    Applebot
    iTMS
  ]
end
