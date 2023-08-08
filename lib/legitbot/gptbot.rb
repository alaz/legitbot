# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://platform.openai.com/docs/gptbot
  class GPTBot < BotMatch
    # @fetch:url https://openai.com/gptbot-ranges.txt
    ip_ranges %w[
      20.15.240.64/28
      20.15.240.80/28
      20.15.240.96/28
      20.15.240.176/28
      20.15.241.0/28
      20.15.242.128/28
      20.15.242.144/28
      20.15.242.192/28
      40.83.2.64/28
    ]
  end

  rule Legitbot::GPTBot, %w[GPTBot]
end
