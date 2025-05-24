# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://adbot.amazon.com
  class AmazonAdBot < BotMatch
    domains 'amazonadbot.com.'
  end

  # https://developer.amazon.com/en/amazonbot
  class AmazonBot < BotMatch
    domains 'crawl.amazonbot.amazon.'
  end

  rule Legitbot::AmazonBot, %w[Amazonbot]
  rule Legitbot::AmazonAdBot, %w[AmazonAdBot]
end
