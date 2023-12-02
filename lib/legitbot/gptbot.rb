# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://platform.openai.com/docs/gptbot
  class GPTBot < BotMatch
    # @fetch:url https://openai.com/gptbot-ranges.txt
    ip_ranges %w[
      52.230.152.0/24
      52.233.106.0/24
    ]
  end

  rule Legitbot::GPTBot, %w[GPTBot]
end
