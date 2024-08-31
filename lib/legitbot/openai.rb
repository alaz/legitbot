# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://platform.openai.com/docs/gptbot
  class GPTBot < BotMatch
    # NOTE: fetching is disabled, see #131
    # @ fetch:url https://openai.com/gptbot.json
    ip_ranges %w[
      20.171.206.0/24
      52.230.152.0/24
      52.233.106.0/24
    ]
  end

  # https://platform.openai.com/docs/bots
  class OpenAIChat < BotMatch
    # NOTE: fetching is disabled, see #131
    # @ fetch:url https://openai.com/chatgpt-user.json
    ip_ranges %w[
      23.98.142.176/28
      40.84.180.224/28
      13.65.240.240/28
      20.97.189.96/28
      20.161.75.208/28
      52.225.75.208/28
      52.156.77.144/28
      40.84.221.208/28
      40.84.221.224/28
      40.84.180.64/28
    ]
  end

  # https://platform.openai.com/docs/bots
  class OpenAISearch < BotMatch
    # NOTE: fetching is disabled, see #131
    # @ fetch:url https://openai.com/searchbot.json
    ip_ranges %w[
      20.42.10.176/28
      172.203.190.128/28
    ]
  end

  rule Legitbot::GPTBot, %w[GPTBot]
  rule Legitbot::OpenAIChat, %w[ChatGPT-User]
  rule Legitbot::OpenAISearch, %w[OAI-SearchBot]
end
