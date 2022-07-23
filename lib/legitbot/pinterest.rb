# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://help.pinterest.com/en/articles/about-pinterest-crawler-0
  class Pinterest < BotMatch
    domains 'pinterest.com.', 'pinterestcrawler.com.'
  end

  rule Legitbot::Pinterest, %w[Pinterestbot Pinterest/0.2]
end
