require 'ipaddr'
require 'irrc'
require 'segment_tree'

module Legitbot
  # https://developers.facebook.com/docs/sharing/webmasters/crawler

  class Facebook < BotMatch
    AS = 'AS32934'

    def valid?
      ip = IPAddr.new(@ip)
      Facebook.valid_ips[ip.ipv4? ? :ipv4 : :ipv6].find(ip)
    end

    @mutex = Mutex.new

    def self.valid_ips
      @mutex.synchronize { @ips ||= load_ips }
    end

    def self.reload!
      @mutex.synchronize { @ips = load_ips }
    end

    def self.load_ips
      w = whois

      Hash[%i(ipv4 ipv6).map { |k|
        [k, SegmentTree.new(w[k].map { |cidr|
            [IPAddr.new(cidr).to_range, true]
          })]
      }]
    end

    def self.whois
      client = Irrc::Client.new
      client.query :radb, AS
      results = client.perform

      { ipv4: results[AS][:ipv4][AS], ipv6: results[AS][:ipv6][AS] }
    end
  end

  rule Legitbot::Facebook, %w(Facebot facebookexternalhit/1.1)
end
