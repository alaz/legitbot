require 'ipaddr'
require 'irrc'
require 'interval_tree'

module Legitbot
  # https://developers.facebook.com/docs/sharing/webmasters/crawler

  class Facebook < BotMatch
    AS = 'AS32934'

    def valid?
      ip = IPAddr.new(@ip)
      Facebook.valid_ips[ip.ipv4? ? :ipv4 : :ipv6].search(ip.to_i).size > 0
    end

    @mutex = Mutex.new

    def self.valid_ips
      @mutex.synchronize { @ips ||= load_ips }
    end

    def self.reload!
      @mutex.synchronize { @ips = load_ips }
    end

    def self.load_ips
      whois.transform_values do |records|
        ranges = records.map do |cidr|
          range = IPAddr.new(cidr).to_range
          (range.begin.to_i..range.end.to_i)
        end
        IntervalTree::Tree.new(ranges)
      end
    end

    def self.whois
      client = Irrc::Client.new
      client.query :radb, AS
      results = client.perform

      %i(ipv4 ipv6).map do |family|
        [family, results[AS][family][AS]]
      end.to_h
      # { ipv4: results[AS][:ipv4][AS], ipv6: results[AS][:ipv6][AS] }
    end
  end

  rule Legitbot::Facebook, %w(Facebot facebookexternalhit/1.1)
end
