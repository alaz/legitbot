require 'segment_tree'
require 'irrc'
require 'concurrent'

module Legitbot
  # https://developers.facebook.com/docs/sharing/webmasters/crawler

  class Facebook < BotMatch
    AS = 'AS32934'
    ValidIPs = Concurrent::Delay.new do
      client = Irrc::Client.new
      client.query :radb, 'AS32934'
      results = client.perform

      Hash[%i(ipv4 ipv6).map { |k|
        [k, SegmentTree.new(results[AS][k][AS].map { |cidr|
            [IPAddr.new(cidr).to_range, true]
          })]
      }]
    end

    def valid?
      ip = IPAddr.new(@ip)
      if ip.ipv4?
        ValidIPs.value[:ipv4].find(ip)
      else
        ValidIPs.value[:ipv6].find(ip)
      end
    end
  end

  rule Legitbot::Facebook, %w(facebookhit facebookexternalhit)
end
