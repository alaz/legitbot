# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://www.marginalia.nu/marginalia-search/for-webmasters/
  class Marginalia < BotMatch
    # https://x.com/MarginaliaNu/status/1824172354081263991
    # @fetch:url https://marginalia-search.com/crawler-ips.txt
    ip_ranges %w[
      81.170.128.52
      193.183.0.162
      193.183.0.163
      193.183.0.164
      193.183.0.165
      193.183.0.166
      193.183.0.167
      193.183.0.168
      193.183.0.169
      193.183.0.170
      193.183.0.171
      193.183.0.172
      193.183.0.173
      193.183.0.174
    ]
  end

  rule Legitbot::Marginalia, %w[search.marginalia.nu]
end
