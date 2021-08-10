# frozen_string_literal: true

module Legitbot # :nodoc:
  # http://aspiegel.com/petalbot
  # https://webmaster.petalsearch.com/site/petalbot
  class Petalbot < BotMatch
    domains 'petalsearch.com.'
  end

  rule Legitbot::Petalbot, %w[PetalBot]
end
