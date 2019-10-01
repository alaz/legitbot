# frozen_string_literal: true

module Legitbot # :nodoc:
  class Imessage < BotMatch
    # https://stackoverflow.com/questions/41499402/what-is-the-user-agent-string-for-ios-macos-imessage
  end

  rule Legitbot::Imessage,
       ['Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 ' \
        '(KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 ' \
        'facebookexternalhit/1.1 Facebot Twitterbot/1.0']
end
