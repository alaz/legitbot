# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    ip_ranges %w[
      23.21.227.69
      40.88.21.235
      50.16.241.113
      50.16.241.114
      50.16.241.117
      50.16.247.234
      52.204.97.54
      52.5.190.19
      54.197.234.188
      54.208.100.253
      54.208.102.37
      107.21.1.8
    ]
  end

  rule Legitbot::DuckDuckGo, %w[DuckDuckBot]
end
