# frozen_string_literal: true

require 'minitest/autorun'
require 'legitbot'

module Legitbot
  class Facebook
    # rubocop:disable Layout/LineLength
    def self.whois
      {
        ipv4: ['69.63.176.0/20', '66.220.144.0/20', '66.220.144.0/21', '69.63.184.0/21', '69.63.176.0/21', '74.119.76.0/22', '69.171.255.0/24', '173.252.64.0/18', '69.171.224.0/19', '69.171.224.0/20', '103.4.96.0/22', '69.63.176.0/24', '173.252.64.0/19', '173.252.70.0/24', '31.13.64.0/18', '31.13.24.0/21', '66.220.152.0/21', '66.220.159.0/24', '69.171.239.0/24', '69.171.240.0/20', '31.13.64.0/19', '31.13.64.0/24', '31.13.65.0/24', '31.13.67.0/24', '31.13.68.0/24', '31.13.69.0/24', '31.13.70.0/24', '31.13.71.0/24', '31.13.72.0/24', '31.13.73.0/24', '31.13.74.0/24', '31.13.75.0/24', '31.13.76.0/24', '31.13.77.0/24', '31.13.96.0/19', '31.13.66.0/24', '173.252.96.0/19', '69.63.178.0/24', '31.13.78.0/24', '31.13.79.0/24', '31.13.80.0/24', '31.13.82.0/24', '31.13.83.0/24', '31.13.84.0/24', '31.13.85.0/24', '31.13.86.0/24', '31.13.87.0/24', '31.13.88.0/24', '31.13.89.0/24', '31.13.90.0/24', '31.13.91.0/24', '31.13.92.0/24', '31.13.93.0/24', '31.13.94.0/24', '31.13.95.0/24', '69.171.253.0/24', '69.63.186.0/24', '31.13.81.0/24', '179.60.192.0/22', '179.60.192.0/24', '179.60.193.0/24', '179.60.194.0/24', '179.60.195.0/24', '185.60.216.0/22', '45.64.40.0/22', '185.60.216.0/24', '185.60.217.0/24', '185.60.218.0/24', '185.60.219.0/24', '129.134.0.0/16', '157.240.0.0/16', '157.240.8.0/24', '157.240.0.0/24', '157.240.1.0/24', '157.240.2.0/24', '157.240.3.0/24', '157.240.4.0/24', '157.240.5.0/24', '157.240.6.0/24', '157.240.7.0/24', '157.240.9.0/24', '157.240.10.0/24', '157.240.16.0/24', '157.240.19.0/24', '157.240.11.0/24', '157.240.12.0/24', '157.240.13.0/24', '157.240.14.0/24', '157.240.15.0/24', '157.240.17.0/24', '157.240.18.0/24', '157.240.20.0/24', '157.240.21.0/24', '157.240.22.0/24', '157.240.23.0/24', '157.240.0.0/17', '69.171.250.0/24', '157.240.24.0/24', '157.240.25.0/24', '199.201.64.0/24', '199.201.65.0/24', '199.201.64.0/22', '204.15.20.0/22', '157.240.192.0/24', '129.134.0.0/17', '157.240.198.0/24'],
        ipv6: []
      }
    end
    # rubocop:enable Layout/LineLength
  end
end

class FacebookTest < Minitest::Test
  def test_valid_ip
    ip = '69.63.186.89'
    match = Legitbot::Facebook.new(ip)
    assert match.valid?

    ip = '69.171.251.1'
    match = Legitbot::Facebook.new(ip)
    assert match.valid?
  end

  def test_invalid_ip
    ip = '127.0.0.1'
    match = Legitbot::Facebook.new(ip)
    assert match.fake?
  end

  def test_user_agent1
    Legitbot.bot(
      'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',
      '31.13.76.56'
    ) do |bot|
      assert_equal :facebook, bot.detected_as
      assert bot.valid?
    end
  end

  def test_user_agent2
    Legitbot.bot(
      'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',
      '173.252.87.8'
    ) do |bot|
      assert_equal :facebook, bot.detected_as
      assert bot.valid?
    end
  end

  # rubocop:disable Layout/LineLength
  def test_user_agent3
    Legitbot.bot(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0',
      '92.243.181.7'
    ) do |bot|
      assert_includes %i[facebook twitter], bot.detected_as
      assert bot.fake?
    end
  end
  # rubocop:enable Layout/LineLength
end
