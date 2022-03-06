# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    # @fetch:url https://help.duckduckgo.com/duckduckgo-help-pages/results/duckduckbot/
    # @fetch:selector section.main article.content ul > li
    ip_ranges %w[
      20.191.45.212
      40.88.21.235
      40.76.173.151
      40.76.163.7
      20.185.79.47
      52.142.26.175
      20.185.79.15
      52.142.24.149
      40.76.162.208
      40.76.163.23
      40.76.162.191
      40.76.162.247
      54.208.102.37
      107.21.1.8
    ]
  end

  rule Legitbot::DuckDuckGo, %w[DuckDuckBot]
end
