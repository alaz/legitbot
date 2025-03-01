# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://integralads.com/ias-privacy-data-management/policies/site-indexing-policy/
  class Ias < BotMatch
    # @fetch:url https://integralads.com/policy-docs/iasbot.json
    # @fetch:jsonpath $.publicIPs[*].ipv4
    ip_ranges %w[
      3.217.168.199
      3.226.51.67
      18.214.43.70
      23.21.212.31
      34.195.212.30
      35.175.92.196
      92.204.170.15
      92.204.190.235
      162.211.125.4
      162.211.125.5
    ]
  end

  rule Legitbot::Ias, %w[ias_crawler ias_wombles]
end
