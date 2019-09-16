# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://support.google.com/webmasters/answer/1061943
  # https://support.google.com/webmasters/answer/80553
  class Google < BotMatch
    domains 'google.com.', 'googlebot.com.'
  end

  rule Legitbot::Google, %w[Googlebot Mediapartners-Google AdsBot-Google]
end
