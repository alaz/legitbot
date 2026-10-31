# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://docs.perplexity.ai/docs/resources/perplexity-crawlers
  class PerplexityBot < BotMatch
    # @fetch:url https://www.perplexity.ai/perplexitybot.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      3.222.232.239/32
      3.224.62.45/32
      18.97.1.228/32
      18.97.9.96/32
      18.97.9.97/32
      18.97.9.98/32
      18.97.9.99/32
      18.97.9.100/32
      18.97.9.101/32
      18.97.9.102/32
      18.97.9.103/32
      18.210.92.235/32
      107.20.236.150/32
    ]
  end

  # https://docs.perplexity.ai/docs/resources/perplexity-crawlers
  class PerplexityUser < BotMatch
    # @fetch:url https://www.perplexity.ai/perplexity-user.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      18.97.43.80/32
      18.97.43.81/32
      18.97.43.82/32
      18.97.43.83/32
      18.97.43.84/32
      18.97.43.85/32
      18.97.43.86/32
      18.97.43.87/32
      34.193.163.52/32
      44.208.221.197/32
    ]
  end

  rule Legitbot::PerplexityBot, %w[PerplexityBot]
  rule Legitbot::PerplexityUser, %w[Perplexity-User]
end
