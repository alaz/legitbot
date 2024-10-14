# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://about.you.com/youbot/
  class You < BotMatch
    # NOTE: fetching is disabled, because You.com disallows crawlers
    # @ fetch:url https://about.you.com/youbot/
    # @fetch:selector section.elementor-section-content-top div.elementor-widget-text-editor pre > code
    ip_ranges %w[
      20.59.40.22
      52.226.199.170
    ]
  end

  rule Legitbot::You, %w[YouBot/]
end
