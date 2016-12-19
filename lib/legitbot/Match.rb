module Legitbot
  class Match
    def initialize(ip, resolver_config = nil)
      @dns = Resolv::DNS.new(resolver_config)
      @ip = ip
    end

    ##
    # Returns a Resolv::DNS::Name instance with
    # the reverse name
    def reverse_domain
      @reverse_domain ||= @dns.getname(@ip)
    end

    ##
    # Returns a String with the reverse name
    def reverse_name
      reverse_domain.to_s
    end

    ##
    # Returns a String with IP created from the reverse name
    def reversed_ip
      @reverse_ip ||= @dns.getaddress(reverse_name)
      @reverse_ip.to_s
    end

    def reverse_resolves?
      reversed_ip == @ip
    end

    def subdomain_of?(*domains)
      domains.any? { |d|
        reverse_domain.subdomain_of? Resolv::DNS::Name.create(d)
      }
    end

    def detected_as
      self.class.name.split('::').last
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
