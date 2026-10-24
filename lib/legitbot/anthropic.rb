# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://support.claude.com/en/articles/8896518
  class ClaudeBot < BotMatch
    # @fetch:url https://claude.com/crawling/bots.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      34.152.124.140/32
      34.153.21.190/32
      34.162.27.34/32
      34.162.86.102/32
      34.162.90.102/32
      34.162.111.78/32
      34.162.153.71/32
      34.162.191.81/32
      34.162.230.222/32
      34.162.244.71/32
      34.186.252.4/32
      136.79.143.251/32
      136.83.20.215/32
      216.73.216.0/22
    ]
  end

  # https://support.claude.com/en/articles/8896518
  class ClaudeUser < BotMatch
    # @fetch:url https://claude.com/crawling/bots.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      34.152.124.140/32
      34.153.21.190/32
      34.162.27.34/32
      34.162.86.102/32
      34.162.90.102/32
      34.162.111.78/32
      34.162.153.71/32
      34.162.191.81/32
      34.162.230.222/32
      34.162.244.71/32
      34.186.252.4/32
      136.79.143.251/32
      136.83.20.215/32
      216.73.216.0/22
    ]
  end

  # https://support.claude.com/en/articles/8896518
  class ClaudeSearchBot < BotMatch
    # @fetch:url https://claude.com/crawling/bots.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      34.152.124.140/32
      34.153.21.190/32
      34.162.27.34/32
      34.162.86.102/32
      34.162.90.102/32
      34.162.111.78/32
      34.162.153.71/32
      34.162.191.81/32
      34.162.230.222/32
      34.162.244.71/32
      34.186.252.4/32
      136.79.143.251/32
      136.83.20.215/32
      216.73.216.0/22
    ]
  end

  rule Legitbot::ClaudeBot, %w[ClaudeBot]
  rule Legitbot::ClaudeUser, %w[Claude-User]
  rule Legitbot::ClaudeSearchBot, %w[Claude-SearchBot]
end
