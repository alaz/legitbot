# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://docs.perplexity.ai/docs/resources/perplexity-crawlers
  class PerplexityBot < BotMatch
    # @fetch:url https://www.perplexity.ai/perplexitybot.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      107.20.236.150/32
      18.210.92.235/32
      18.97.1.228/30
      18.97.9.96/29
      3.211.124.183/32
      3.222.232.239/32
      3.224.62.45/32
      3.231.139.107/32
    ]
  end

  # https://docs.perplexity.ai/docs/resources/perplexity-crawlers
  class PerplexityUser < BotMatch
    # @fetch:url https://www.perplexity.ai/perplexity-user.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      18.97.21.0/30
      18.97.43.80/29
      34.193.163.52/32
      44.208.221.197/32
    ]
  end

  rule Legitbot::PerplexityBot, %w[PerplexityBot]
  rule Legitbot::PerplexityUser, %w[Perplexity-User]
end
