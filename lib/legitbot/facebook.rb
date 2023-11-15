# frozen_string_literal: true

require 'irrc'

module Legitbot # :nodoc:
  # https://developers.facebook.com/docs/sharing/webmasters/crawler
  class Facebook < BotMatch
    AS = 'AS32934'

    ip_ranges do
      client = Irrc::Client.new
      client.query :radb, AS, source: :radb
      results = client.perform

      %i[ipv4 ipv6].map do |family|
        results[AS][family][AS]
      end.flatten
    end
  end

  rule Legitbot::Facebook, %w[
    facebookexternalhit/1.1
    facebookcatalog/1.0
  ]
end
