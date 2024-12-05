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
      168.119.64.245/32
      168.119.64.246/31
      168.119.64.248/30
      168.119.64.252/31
      168.119.64.254/32
      168.119.65.43/32
      168.119.65.44/30
      168.119.65.48/29
      168.119.65.56/30
      168.119.65.60/31
      168.119.65.62/32
      168.119.65.107/32
      168.119.65.108/30
      168.119.65.112/29
      168.119.65.120/30
      168.119.65.124/31
      168.119.65.126/32
      168.119.68.117/32
      168.119.68.118/31
      168.119.68.120/30
      168.119.68.124/31
      168.119.68.126/32
      168.119.68.171/32
      168.119.68.172/30
      168.119.68.176/29
      168.119.68.184/30
      168.119.68.188/31
      168.119.68.190/32
      168.119.68.235/32
      168.119.68.236/30
      168.119.68.240/29
      168.119.68.248/30
      168.119.68.252/31
      168.119.68.254/32
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
      202.8.40.0/22
      202.94.84.110/31
      202.94.84.112/31
    ]
  end

  rule Legitbot::Ahrefs, %w[AhrefsBot]
end
