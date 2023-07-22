# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    # @fetch:url https://duckduckgo.com/duckduckgo-help-pages/results/duckduckbot/
    # @fetch:selector section.main article.content ul > li
    ip_ranges %w[
      20.185.79.15
      20.185.79.47
      20.191.45.212
      40.76.162.191
      40.76.162.208
      40.76.162.247
      40.76.163.7
      40.76.163.23
      40.76.173.151
      40.88.21.235
      52.142.24.149
      52.142.26.175
    ]
  end

  rule Legitbot::DuckDuckGo, %w[DuckDuckBot]
end
