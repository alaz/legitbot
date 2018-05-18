require 'ipaddr'

module Legitbot
  # https://support.apple.com/en-us/HT204683

  class Apple < BotMatch
    Range = IPAddr.new('17.0.0.0/8')

    def valid?
      ip = IPAddr.new @ip
      Range.include? ip
    end
  end

  rule Legitbot::Apple, %w(Applebot)
end
