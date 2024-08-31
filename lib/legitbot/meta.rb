# frozen_string_literal: true

require 'irrc'

module Legitbot # :nodoc:
  module MetaIpRanges # :nodoc:
    AS = 'AS32934'

    def fetch_ip_ranges
      client = Irrc::Client.new
      client.query :radb, AS, source: :radb
      results = client.perform

      %i[ipv4 ipv6].map do |family|
        results[AS][family][AS]
      end.flatten
    end
  end

  # https://developers.facebook.com/docs/sharing/webmasters/web-crawlers/
  class Meta < BotMatch
    extend MetaIpRanges

    ip_ranges do
      fetch_ip_ranges
    end
  end

  rule Legitbot::Meta, %w[
    meta-externalagent
    meta-externalfetcher
  ]
end
