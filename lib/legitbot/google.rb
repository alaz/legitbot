require 'resolv'

module Legitbot
  # https://support.google.com/webmasters/answer/1061943
  # https://support.google.com/webmasters/answer/80553

  class Google < BotMatch
    ValidDomains = ["google.com.", "googlebot.com."]

    def valid?
      subdomain_of?(*Google::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Google, %w(Googlebot Mediapartners-Google AdsBot-Google)
end
