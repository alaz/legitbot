# frozen_string_literal: true

require 'ipaddr'

module Legitbot # :nodoc:
  # https://support.apple.com/en-us/HT204683
  class Apple < BotMatch
    ip_ranges '17.0.0.0/8'
  end

  # https://support.apple.com/en-us/HT204683
  # rubocop:disable Naming/ClassAndModuleCamelCase
  class Apple_as_Google < BotMatch
    ip_ranges '17.0.0.0/8'
  end
  # rubocop:enable Naming/ClassAndModuleCamelCase

  rule Legitbot::Apple, %w[Applebot]
  rule Legitbot::Apple_as_Google, %w[Googlebot]
end
