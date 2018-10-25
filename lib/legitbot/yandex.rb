module Legitbot
  # https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.html

  class Yandex < BotMatch
    ValidDomains = ["yandex.ru.", "yandex.net.", "yandex.com."]

    def valid?
      subdomain_of?(*Yandex::ValidDomains) && reverse_resolves?
    end
  end

  rule Legitbot::Yandex, %w(YandexBot YandexAccessibilityBot YandexMobileBot
    YandexDirectDyn YandexScreenshotBot YandexImages YandexVideo YandexVideoParser
    YandexMedia YandexBlogs YandexFavicons YandexWebmaster YandexPagechecker
    YandexImageResizer YaDirectFetcher YandexCalendar YandexSitelinks YandexMetrika
    YandexNews YandexVertis YandexSearchShop YandexVerticals)
end
