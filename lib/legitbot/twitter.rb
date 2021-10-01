# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started
  # https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/troubleshooting-cards
  class Twitter < BotMatch
    ip_ranges %w[
      199.16.156.0/22
      199.59.148.0/22
      192.133.76.0/22
    ]
  end

  rule Legitbot::Twitter, %w[Twitterbot]
end
