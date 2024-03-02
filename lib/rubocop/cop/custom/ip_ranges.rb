# frozen_string_literal: true

require 'ipaddr'
require 'net/http'
require 'nokogiri'
require 'jsonpath'
require 'rubocop'
require 'uri'

module RuboCop
  module Cop
    module Custom
      class IpRanges < Base # :nodoc:
        extend AutoCorrector

        MSG = 'Outdated list of IP ranges compared to %<url>s'
        REGEXP = /^\s*#\s*@fetch:(?<param>[a-z0-9_]+)\s+(?<arg>.*)?/.freeze

        def_node_matcher :on_ip_ranges, <<~PATTERN
          (send nil? :ip_ranges $(array str+))
        PATTERN

        def on_send(node)
          on_ip_ranges(node) do |value|
            params = fetch_params(node)
            return unless mandatory_params?(params)

            existing_ips = normalise_list(read_node_ips(value))
            new_ips = normalise_list(fetch_ips(**params))
            return unless new_ips
            return if existing_ips == new_ips

            register_offense(value, new_ips, **params)
          end
        end

        private

        def fetch_ips(url:, selector: nil, jsonpath: nil)
          body = get_url url
          return unless body
          return parse_html(body, selector) if selector
          return parse_json(body, jsonpath) if jsonpath

          parse_text(body)
        end

        def get_url(url)
          response = Net::HTTP.get_response URI(url)
          unless response.is_a?(Net::HTTPOK)
            add_global_offense "Could not fetch IPs from #{url} , HTTP status code #{response.code}"
            return
          end

          response.value
          response.body
        end

        def parse_html(body, selector)
          document = Nokogiri::HTML body
          document.css(selector).map(&:content)
        end

        def parse_json(body, jsonpath)
          document = JSON.parse body
          JsonPath.new(jsonpath).on(document)
        end

        def parse_text(body)
          body.lines.map(&:chomp)
        end

        def read_node_ips(value)
          value.child_nodes.map(&:value)
        end

        def normalise_list(ips)
          ips.sort_by(&IPAddr.method(:new))
        end

        def register_offense(node, new_ips, **params)
          message = format(MSG, params)
          add_offense node, message: message do |corrector|
            corrector.replace node, node_replacement(new_ips)
          end
        end

        def mandatory_params?(params)
          params.include?(:url)
        end

        def fetch_params(node)
          comments = processed_source.ast_with_comments[node]
          comments.map do |comment|
            match = comment.text.match(REGEXP)
            next unless match

            [match[:param].to_sym, match[:arg]]
          end.compact.to_h
        end

        def node_replacement(new_ips)
          contents = new_ips.join("\n")
          "%w[\n#{contents}\n]"
        end
      end
    end
  end
end
