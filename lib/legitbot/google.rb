require 'resolv'

module Legitbot
  # https://support.google.com/webmasters/answer/1061943
  # https://support.google.com/webmasters/answer/80553

  class Google < Match
    ValidDomains = ["google.com.", "googlebot.com."]

    def initialize(ip, resolver_config = nil)
      super(ip, resolver_config)
    end

    def valid?
      subdomain_of?(*Google::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Google, %w(Googlebot Mediapartners-Google AdsBot-Google)
end
