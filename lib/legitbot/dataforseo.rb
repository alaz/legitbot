# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://dataforseo.com/dataforseo-bot
  class DataForSEO < BotMatch
    domains 'dataforseo.com.'
  end

  rule Legitbot::DataForSEO, %w[DataForSeoBot]
end
