# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://adbot.amazon.com/index.html
  class Amazon < BotMatch
    domains 'amazonadbot.com.'
  end

  rule Legitbot::Amazon, %w[AmazonAdBot]
end
