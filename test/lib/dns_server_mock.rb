# frozen_string_literal: true

require 'dns_mock'
require 'json'

TEST_DNS_RECORDS = {
  # Malicious
  '149.210.164.47' => {
    ptr: %w[malicious.spam.co]
  },

  # Ahrefs
  'ip-54-36-148-0.a.ahrefs.com' => {
    a: %w[54.36.148.0]
  },
  '54.36.148.0' => {
    ptr: %w[ip-54-36-148-0.a.ahrefs.com]
  },

  # Alexa
  '52.86.176.3' => {
    ptr: %w[crawl-52-86-176-3.alexa.com]
  },

  # Amazon
  'crawler-54-166-7-90.amazonadbot.com' => {
    a: %w[54.166.7.90]
  },
  '54.166.7.90' => {
    ptr: %w[crawler-54-166-7-90.amazonadbot.com]
  },

  # Apple
  '17-58-98-60.applebot.apple.com' => {
    a: %w[17.58.98.60]
  },
  '17.58.98.60' => {
    ptr: %w[17-58-98-60.applebot.apple.com]
  },

  # Google
  'crawl-66-249-64-141.googlebot.com' => {
    a: %w[66.249.64.141]
  },
  '66.249.64.141' => {
    ptr: %w[crawl-66-249-64-141.googlebot.com]
  },

  # Petalbot
  'petalbot-114-119-134-10.petalsearch.com' => {
    a: %w[114.119.134.10]
  },
  '114.119.134.10' => {
    ptr: %w[petalbot-114-119-134-10.petalsearch.com]
  },

  # Pinterest
  'crawl-54-236-1-11.pinterest.com' => {
    a: %w[54.236.1.11]
  },
  '54.236.1.11' => {
    ptr: %w[crawl-54-236-1-11.pinterest.com]
  }
}.freeze

class DnsServer
  class << self
    attr_accessor :mock
  end

  @mock = DnsMock.start_server records: TEST_DNS_RECORDS
end

module DnsServerMock
  def before_all
    super

    Legitbot.resolver_config = {
      nameserver: 'localhost',
      nameserver_port: [['localhost', DnsServer.mock.port]]
    }
  end

  def after_all
    Legitbot.resolver_config = nil

    super
  end
end
