# frozen_string_literal: true

module Legitbot # :nodoc:
  # https://support.alexa.com/hc/en-us/articles/360046707834-What-are-the-IP-addresses-for-Alexa-s-Certify-and-Site-Audit-crawlers-
  # https://support.alexa.com/hc/en-us/articles/200462340
  # https://support.alexa.com/hc/en-us/articles/200450194
  class Alexa < BotMatch
    ip_ranges %w[
      52.86.176.3
      52.4.48.181
      52.2.182.169
      52.86.185.29
    ]
  end

  rule Legitbot::Alexa, %w[Alexabot ia_archiver]
end
