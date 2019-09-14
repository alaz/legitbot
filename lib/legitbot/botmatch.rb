require 'resolv'
require 'ipaddr'

module Legitbot
  ##
  # Represents a bot instance match. Typical methods are
  # +valid?+, +fake?+ and +detected_as+
  #
  class BotMatch
    def initialize(ip, resolver_config = nil)
      @dns = Resolv::DNS.new(resolver_config)
      @ip = ip
    end

    ##
    # Returns a Resolv::DNS::Name instance with
    # the reverse names
    def reverse_domains
      @reverse_domains ||= @dns.getnames(@ip)
    rescue Resolv::ResolvError
      @reverse_domains ||= nil
    end

    ##
    # Returns a String with the first reverse name
    def reverse_name
      reverse_domains&.first&.to_s
    end

    ##
    # Returns an array of Strings with all available reverse names
    def reverse_names
      reverse_domains.map { |d| d.to_s }
    end

    ##
    # Returns a String with IP created from the reverse name
    def reversed_ip
      return nil if reverse_name.nil?

      @reverse_ip ||= @dns.getaddress(reverse_name)
      @reverse_ip.to_s
    end

    ##
    # Returns an Array of String with IP created from the reverse name
    def reversed_ips
      return [] if reverse_names.empty?
      reverse_ips = []

      reverse_names.each { |rev_name|
        @dns.getaddresses(rev_name).each { |addr|
          reverse_ips.push addr.to_s
        }
      }

      return reverse_ips
    end

    def reverse_resolves?
      @ip == reversed_ip
    end

    def reverses_resolve?
      reversed_ips.include? @ip
    end

    def subdomain_of?(*domains)
      return false if reverse_names.empty?

      domains.any? { |d|
        reverse_domains.any? { |reverse_domain|
          reverse_domain.subdomain_of? Resolv::DNS::Name.create(d)
        }
      }
    end

    def detected_as
      self.class.name.split('::').last.downcase.to_sym
    end

    def fake?
      !valid?
    end

    def self.valid?(ip, resolver_config = nil)
      self.new(ip, resolver_config).valid?
    end

    def self.fake?(ip, resolver_config = nil)
      self.new(ip, resolver_config).fake?
    end
  end
end
