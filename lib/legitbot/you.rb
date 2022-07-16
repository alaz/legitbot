# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://about.you.com/youbot/
  class You < BotMatch
    ip_ranges %w[
      20.59.40.22
    ]
  end

  rule Legitbot::You, %w[YouBot/]
end
