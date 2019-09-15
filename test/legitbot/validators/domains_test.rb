# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

module Legitbot
  module Validators
    class NoDomains
      include Domains
    end

    class DomainMatch
      include Domains
      domains 'search.msn.com', reverse: false

      @resolver = Minitest::Mock.new
      @resolver.expect(:getnames,
                       ['po18-218.co2-6nf-srch-2b.ntwk.msn.net',
                        'msnbot-157-55-39-132.search.msn.com'].map do |d|
                         Resolv::DNS::Name.create(d)
                       end, [String])
      @resolver.expect(:getnames,
                       ['crawl-66-249-64-141.googlebot.com'].map do |d|
                         Resolv::DNS::Name.create(d)
                       end, [String])
    end

    class ReverseMatch
      include Domains
      domains 'search.msn.com'
    end

    class DomainsTest < Minitest::Test
      def test_no_domains
        assert NoDomains.valid_domain?('127.0.0.1')
      end

      def test_reverse_domain
        assert DomainMatch.valid_domain?('127.0.0.1')
        refute DomainMatch.valid_domain?('127.0.0.1')
      end

      def test_reverse_ip
        dlist = ['po18-218.co2-6nf-srch-2b.ntwk.msn.net',
                 'msnbot-157-55-39-132.search.msn.com'].map do |d|
          Resolv::DNS::Name.create(d)
        end

        ReverseMatch.resolver.stub :getnames, dlist do
          ReverseMatch.resolver.stub :getaddress, '127.0.0.1' do
            assert ReverseMatch.valid_domain?('127.0.0.1')
            refute ReverseMatch.valid_domain?('127.0.0.2')
          end
        end
      end
    end
  end
end
