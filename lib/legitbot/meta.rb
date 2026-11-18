# frozen_string_literal: true

require 'irrc'

module Legitbot # :nodoc:
  module MetaIpRanges # :nodoc:
    AS = 'AS32934'

    def fetch_ip_ranges
      client = Irrc::Client.new
      client.query :radb, AS, source: :radb
      results = client.perform

      routes = results&.fetch(AS, nil)
      ranges = %i[ipv4 ipv6].flat_map do |family|
        routes&.dig(family, AS) || []
      end

      # Empty ranges otherwise disable IP verification in the validator.
      raise Validators::IpRanges::Unavailable, 'No Meta routes returned by RADB' if ranges.empty?

      ranges
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
