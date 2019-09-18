# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.html
  class Yandex < BotMatch
    domains 'yandex.ru.', 'yandex.net.', 'yandex.com.'
  end

  rule Legitbot::Yandex, %w[
    YandexBot
    YandexAccessibilityBot
    YandexMobileBot
    YandexDirectDyn
    YandexScreenshotBot
    YandexImages
    YandexVideo
    YandexVideoParser
    YandexMedia
    YandexBlogs
    YandexFavicons
    YandexWebmaster
    YandexPagechecker
    YandexImageResizer
    YaDirectFetcher
    YandexCalendar
    YandexSitelinks
    YandexMetrika
    YandexNews
    YandexVertis
    YandexSearchShop
    YandexVerticals
  ]
end
