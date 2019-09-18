# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://blogs.bing.com/webmaster/2012/08/31/how-to-verify-that-bingbot-is-bingbot/
  class Bing < BotMatch
    domains 'search.msn.com.'
  end

  rule Legitbot::Bing, %w[Bingbot bingbot]
end
