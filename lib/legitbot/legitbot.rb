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
    bots =
      @rules.select { |rule|
        rule[:fragments].any? {|f| userAgent.index f}
      }.map { |rule|
        rule[:class].new(ip, resolver_config)
      }

    selected = bots.select { |b| b.valid? }.first if bots.size > 1
    selected = bots.first if selected.nil?

    if selected && block_given?
      yield selected
    else
      selected
    end
  end

  def self.rule(clazz, fragments)
    @rules << {:class => clazz, :fragments => fragments}
  end
end
