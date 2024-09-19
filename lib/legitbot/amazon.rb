# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://adbot.amazon.com/index.html
  # https://developer.amazon.com/amazonbot
  class Amazon < BotMatch
    domains 'amazon.com.', 'amazonadbot.com.'
  end

  rule Legitbot::Amazon, %w[Amazonbot AmazonAdBot]
end
