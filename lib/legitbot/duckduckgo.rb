module Legitbot
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    ValidIPs = %w(50.16.241.113 50.16.241.114 50.16.241.117 50.16.247.234 52.204.97.54 52.5.190.19 54.197.234.188 54.208.100.253 23.21.227.69)

    def valid?
      DuckDuckGo::ValidIPs.include? @ip
    end
  end

  rule Legitbot::DuckDuckGo, %w(DuckDuckBot)
end
