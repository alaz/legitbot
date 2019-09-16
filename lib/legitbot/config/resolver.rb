# frozen_string_literal: true

require 'resolv'

module Legitbot
  module Config
    module Resolver # :nodoc:
      def resolver_config(options = nil)
        @resolver_config = options
      end

      def resolver
        @resolver_config ||= Legitbot.resolver_config
        @resolver ||= Resolv::DNS.new @resolver_config
      end
    end
  end
end
