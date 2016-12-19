module Legitbot
  # https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.xml

  class Yandex < Match
    ValidDomains = ["yandex.ru.", "yandex.net.", "yandex.com."]

    def initialize(ip, resolver_config = nil)
      super(ip, resolver_config)
    end

    def valid?
      subdomain_of?(*Yandex::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Yandex, %w(YandexBot YandexMobileBot YandexImages YandexVideo
    YandexMedia YandexBlogs YandexFavicons YandexWebmaster YandexPagechecker
    YandexImageResizer YandexSitelinks YandexMetrika YandexDirectDyn YandexRCA
    YaDirectFetcher YandexAntivirus YandexVertis YandexCalendar)
end
