require 'segment_tree'
require 'irrc'
require 'monitor'
require 'ipaddr'

module Legitbot
  # https://developers.facebook.com/docs/sharing/webmasters/crawler

  class Facebook < BotMatch
    lock = Monitor.new

    AS = 'AS32934'
    ValidIPs = lock.synchronize do
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
      ValidIPs[ip.ipv4? ? :ipv4 : :ipv6].find(ip)
    end
  end

  rule Legitbot::Facebook, %w(facebookhit facebookexternalhit)
end
