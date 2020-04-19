# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.html
  class Yandex < BotMatch
    domains 'yandex.ru.', 'yandex.net.', 'yandex.com.'
  end

  rule Legitbot::Yandex, %w[
    YandexAccessibilityBot
    YandexAdNet
    YandexBlogs
    YandexBot/
    YandexCalendar
    YandexDirect/
    YandexDirectDyn
    YandexFavicons
    YaDirectFetcher
    YandexForDomain
    YandexImages
    YandexImageResizer
    YandexMobileBot
    YandexMarket
    YandexMedia
    YandexMetrika
    YandexMobileScreenShotBot
    YandexNews
    YandexOntoDB
    YandexOntoDBAPI
    YandexPagechecker
    YandexPartner
    YandexRCA
    YandexSearchShop
    YandexSitelinks
    YandexSpravBot
    YandexTracker
    YandexTurbo
    YandexVertis
    YandexVerticals
    YandexVideo
    YandexVideoParser
    YandexWebmaster
    YandexScreenshotBot
    YandexMedianaBot
  ]
end
