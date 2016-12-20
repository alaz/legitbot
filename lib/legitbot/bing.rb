module Legitbot
  # https://blogs.bing.com/webmaster/2012/08/31/how-to-verify-that-bingbot-is-bingbot/
  class Bing < BotMatch
    ValidDomains = ["search.msn.com."]

    def valid?
      subdomain_of?(*Bing::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Bing, %w(Bingbot bingbot)
end
