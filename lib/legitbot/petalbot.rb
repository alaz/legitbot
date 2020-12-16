# frozen_string_literal: true

module Legitbot # :nodoc:
  # http://aspiegel.com/petalbot
  class Petalbot < BotMatch
    domains 'aspiegel.com.'
  end

  rule Legitbot::Petalbot, %w[PetalBot]
end
