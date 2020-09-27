# frozen_string_literal: true

require 'ipaddr'

module Legitbot # :nodoc:
  # https://support.apple.com/en-us/HT204683
  class Apple < BotMatch
    ip_ranges '17.0.0.0/8'
  end

  rule Legitbot::Apple, %w[Applebot]
end
