# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://ahrefs.com/robot
  class Ahrefs < BotMatch
    # @fetch:url https://api.ahrefs.com/v3/public/crawler-ip-ranges?output=json
    # @fetch:jsonpath $.prefixes[*].ipv4Prefix
    ip_ranges %w[
      5.39.1.224/27
      5.39.109.160/27
      15.235.27.0/24
      15.235.96.0/24
      15.235.98.0/24
      37.59.204.128/27
      51.68.247.192/27
      51.75.236.128/27
      51.89.129.0/24
      51.161.37.0/24
      51.161.65.0/24
      51.195.183.0/24
      51.195.215.0/24
      51.195.244.0/24
      51.222.95.0/24
      51.222.168.0/24
      51.222.253.0/26
      54.36.148.0/23
      54.37.118.64/27
      54.38.147.0/24
      54.39.0.0/24
      54.39.6.0/24
      54.39.89.0/24
      54.39.136.0/24
      54.39.203.0/24
      54.39.210.0/24
      92.222.104.192/27
      92.222.108.96/27
      94.23.188.192/27
      142.44.220.0/24
      142.44.225.0/24
      142.44.228.0/24
      142.44.233.0/24
      148.113.128.0/24
      148.113.130.0/24
      167.114.139.0/24
      176.31.139.0/27
      195.154.122.0/23
      195.154.126.0/23
      198.244.168.0/24
      198.244.183.0/24
      198.244.186.193/32
      198.244.186.194/31
      198.244.186.196/30
      198.244.186.200/31
      198.244.186.202/32
      198.244.226.0/24
      198.244.240.0/24
      198.244.242.0/24
      202.8.40.0/23
      202.8.42.0/24
      202.8.43.0/25
      202.8.43.128/26
      202.8.43.192/27
      202.8.43.224/29
      202.8.43.232/30
      202.8.43.236/32
      202.94.84.110/31
      202.94.84.112/31
    ]
  end

  rule Legitbot::Ahrefs, %w[AhrefsBot]
end
