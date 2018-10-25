module Legitbot
  # https://help.pinterest.com/en/articles/about-pinterest-crawler-0

  class Pinterest < BotMatch
    ValidDomains = ["pinterest.com."]

    def valid?
      subdomain_of?(*Pinterest::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Pinterest, %w(Pinterestbot Pinterest/0.2)
end
