# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://www.marginalia.nu/marginalia-search/for-webmasters/
  class Marginalia < BotMatch
    ip_ranges %w[
      81.170.128.21/32
    ]
  end

  rule Legitbot::Marginalia, %w[search.marginalia.nu]
end
