# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    # @fetch:url https://duckduckgo.com/duckduckgo-help-pages/results/duckduckbot/
    # @fetch:selector section.main article.content ul > li
    ip_ranges %w[
      20.12.141.99
      20.40.133.240
      20.49.136.28
      20.50.168.91
      20.185.79.15
      20.185.79.47
      20.191.45.212
      20.193.45.113
      40.76.162.191
      40.76.162.208
      40.76.162.247
      40.76.163.7
      40.76.163.23
      40.76.173.151
      40.80.242.63
      40.88.21.235
      51.107.40.209
      51.116.131.221
      51.120.48.122
      52.142.24.149
      52.142.26.175
    ]
  end

  rule Legitbot::DuckDuckGo, %w[DuckDuckBot]
end
