module Legitbot
  # https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.xml

  class Yandex < BotMatch
    ValidDomains = ["yandex.ru.", "yandex.net.", "yandex.com."]

    def valid?
      subdomain_of?(*Yandex::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Yandex, %w(YandexBot YandexMobileBot YandexImages YandexVideo
    YandexMedia YandexBlogs YandexFavicons YandexWebmaster YandexPagechecker
    YandexImageResizer YandexSitelinks YandexMetrika YandexDirectDyn YandexRCA
    YaDirectFetcher YandexAntivirus YandexVertis YandexCalendar)
end
