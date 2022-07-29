# frozen_string_literal: true

require 'simplecov'
require 'simplecov-cobertura'
SimpleCov.start do
  formatter SimpleCov::Formatter::CoberturaFormatter
  add_filter %r{^/lib/rubocop/}
  add_filter %r{^/test/}
end

require 'legitbot'

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
