# frozen_string_literal: true

module Legitbot # :nodoc:
  # http://webmeup-crawler.com/
  class BLEXBot < BotMatch
    domains 'webmeup.com.'
  end

  rule Legitbot::BLEXBot, %w[BLEXBot]
end
