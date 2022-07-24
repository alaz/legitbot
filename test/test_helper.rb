# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'simplecov-cobertura'
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter

require 'legitbot'

require 'minitest/autorun'
require 'minitest/hooks/test'
require 'lib/dns_server_mock'
