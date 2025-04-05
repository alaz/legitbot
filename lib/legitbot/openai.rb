# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://platform.openai.com/docs/gptbot
  class GPTBot < BotMatch
    # @fetch:url https://openai.com/gptbot.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      4.227.36.0/25
      20.125.66.80/28
      20.171.206.0/24
      20.171.207.0/24
      52.230.152.0/24
      172.182.204.0/24
    ]
  end

  # https://platform.openai.com/docs/bots
  class OpenAIChat < BotMatch
    # @fetch:url https://openai.com/chatgpt-user.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      4.151.241.240/28
      4.196.118.112/28
      4.197.22.112/28
      13.83.167.128/28
      20.97.189.96/28
      20.161.75.208/28
      20.215.188.192/28
      23.98.179.16/28
      23.98.186.176/28
      23.98.186.192/28
      40.84.221.208/28
      40.84.221.224/28
      40.116.73.208/28
      51.8.155.48/28
      51.8.155.64/28
      51.8.155.112/28
      52.156.77.144/28
      52.159.227.32/28
      52.159.249.96/28
      52.190.190.16/28
      52.225.75.208/28
      52.230.163.32/28
      52.230.164.176/28
      52.236.94.144/28
      52.255.111.48/28
      52.255.111.80/28
      52.255.111.112/28
      57.154.175.0/28
      68.221.67.192/28
      68.221.67.224/28
      135.237.131.208/28
      137.116.165.208/28
      172.178.140.144/28
      172.178.141.112/28
      172.178.141.128/28
      172.183.222.128/28
      172.213.12.112/28
      172.213.21.16/28
    ]
  end

  # https://platform.openai.com/docs/bots
  class OpenAISearch < BotMatch
    # @fetch:url https://openai.com/searchbot.json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      20.42.10.176/28
      51.8.102.0/24
      135.234.64.0/24
      172.203.190.128/28
    ]
  end

  rule Legitbot::GPTBot, %w[GPTBot]
  rule Legitbot::OpenAIChat, %w[ChatGPT-User]
  rule Legitbot::OpenAISearch, %w[OAI-SearchBot]
end
