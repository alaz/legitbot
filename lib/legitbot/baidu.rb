# frozen_string_literal: true

module Legitbot # :nodoc:
  # http://help.baidu.com/question?prod_en=master&class=498&id=1000973
  class Baidu < BotMatch
    domains 'baidu.com.', 'baidu.jp.', reverse: false
  end

  rule Legitbot::Baidu, %w[Baiduspider]
end
