# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://ahrefs.com/robot
  class Ahrefs < BotMatch
    ip_ranges %w[
      54.36.148.0/24
      54.36.149.0/24
      54.36.150.0/24
      195.154.122.0/24
      195.154.123.0/24
      195.154.126.0/24
      195.154.127.0/24
    ]
  end

  rule Legitbot::Ahrefs, %w[AhrefsBot]
end
