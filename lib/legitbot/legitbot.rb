module Legitbot
  @rules = []

  ##
  # Lookup a bot based on its signature from +User-Agent+ header.
  #
  # If a block given, passes the found bot to the block.
  #
  # Returns +nil+ if no bot found and a bot match instance
  # otherwise.
  # :yields: a found bot
  #
  def self.bot(userAgent, ip, resolver_config = nil)
    bot =
      @rules.select { |rule|
        rule[:fragments].any? {|f| userAgent.index f}
      }.map { |rule|
        rule[:class].new(ip, resolver_config)
      }.first

    if bot && block_given?
      yield bot
    else
      bot
    end
  end

  def self.rule(clazz, fragments)
    @rules << {:class => clazz, :fragments => fragments}
  end
end
