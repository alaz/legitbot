# frozen_string_literal: true

require_relative 'meta'

module Legitbot # :nodoc:
  # https://developers.facebook.com/docs/sharing/webmasters/crawler
  class Facebook < BotMatch
    extend MetaIpRanges

    ip_ranges do
      fetch_ip_ranges
    end
  end

  rule Legitbot::Facebook, %w[
    facebookexternalhit/1.1
    facebookcatalog/1.0
  ]
end
