module Legitbot
  @rules = []

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
