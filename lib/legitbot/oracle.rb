# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://www.oracle.com/corporate/acquisitions/grapeshot/crawler.html
  class Oracle < BotMatch
    ip_ranges '148.64.56.0/24'
  end

  rule Legitbot::Oracle, %w[GrapeshotCrawler]
end
