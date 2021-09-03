# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://www.oracle.com/corporate/acquisitions/grapeshot/crawler.html
  class Oracle < BotMatch
    ip_ranges %w[
      132.145.9.5
      132.145.11.125
      132.145.14.70
      132.145.15.209
      132.145.64.33
      132.145.66.116
      132.145.66.156
      132.145.67.248
      140.238.81.78
      140.238.83.181
      140.238.94.137
      140.238.95.47
      140.238.95.199
      152.67.128.219
      152.67.137.35
      152.67.138.180

      148.64.56.64/28
      148.64.56.79
      148.64.56.80
      148.64.56.112/28
      148.64.56.127
      148.64.56.128
    ]
  end

  rule Legitbot::Oracle, %w[GrapeshotCrawler]
end
