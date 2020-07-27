# frozen_string_literal: true

##
# Bot lookup based on user agent
module Legitbot
  @rules = []

  class << self
    attr_accessor :resolver_config
  end

  ##
  # Lookup a bot based on its signature from +User-Agent+ header.
  #
  # If a block given, passes the found bot to the block.
  #
  # Returns +nil+ if no bot found and a bot match instance
  # otherwise.
  # :yields: a found bot
  #
  # rubocop:disable Metrics/CyclomaticComplexity
  def self.bot(user_agent, ip)
    bots = @rules
           .select { |rule| rule[:fragments].any? { |f| user_agent.index f } }
           .map { |rule| rule[:class].new(ip) }

    selected = bots.select(&:valid?).first if bots.size > 1
    selected = bots.last if selected.nil?

    if selected && block_given?
      yield selected
    else
      selected
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def self.rule(clazz, fragments)
    @rules << { class: clazz, fragments: fragments }
  end
end
