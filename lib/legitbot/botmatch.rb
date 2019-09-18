# frozen_string_literal: true

require_relative 'config/resolver'
require_relative 'validators/domains'
require_relative 'validators/ip_ranges'

module Legitbot
  ##
  # Represents a bot instance match. Typical methods are
  # +valid?+, +fake?+ and +detected_as+
  #
  class BotMatch
    include Legitbot::Validators::IpRanges
    include Legitbot::Validators::Domains

    def initialize(ip)
      @ip = ip
    end

    def detected_as
      self.class.name.split('::').last.downcase.to_sym
    end

    def valid?
      valid_ip? && valid_domain?
    end

    def fake?
      !valid?
    end

    def self.valid?(ip)
      new(ip).valid?
    end

    def self.fake?(ip)
      new(ip).fake?
    end
  end
end
