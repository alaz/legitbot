module Legitbot
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    ValidIPs = %w(107.20.237.51 23.21.226.191 107.21.1.8 54.208.102.37)

    def valid?
      DuckDuckGo::ValidIPs.include? @ip
    end
  end

  rule Legitbot::DuckDuckGo, %w(DuckDuckGo)
end
