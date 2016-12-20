module Legitbot
  # https://duckduckgo.com/duckduckbot
  class DuckDuckGo < BotMatch
    ValidIPs = %w(72.94.249.34 72.94.249.35 72.94.249.36 72.94.249.37 72.94.249.38)

    def valid?
      DuckDuckGo::ValidIPs.include? @ip
    end
  end

  rule Legitbot::DuckDuckGo, %w(DuckDuckGo)
end
