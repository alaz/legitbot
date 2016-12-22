# Legitbot [![Build Status](https://secure.travis-ci.org/alaz/legitbot.png?branch=master)](http://travis-ci.org/alaz/legitbot) [![Gem Version](https://badge.fury.io/rb/legitbot.svg)](https://badge.fury.io/rb/legitbot)

Ruby gem to check if an IP really belongs to some bot, typically a search
engine. This can of much help if one wants to protect his/her web site from
malicious scanners who pretend to be e.g. a Googlebot.

## Usage

Suppose you have a Web request and you'd like to make sure it's not from a fake
search engine:

```ruby
bot = Legitbot.bot(userAgent, ip)
```

`bot` will be `nil` if no bot signature was found in the `User-Agent`. Otherwise,
it will be an instance with methods

```ruby
bot.detected_as # => "Google"
bot.valid? # => true
bot.fake? # => false
```

Sometimes you already know what search engine to expect. For example, you may
be using [rack-attack](https://github.com/kickstarter/rack-attack):

```ruby
Rack::Attack.blocklist("fake Googlebot") do |req|
  req.user_agent =~ %r(Googlebot) && Legitbot::Google.fake?(req.ip)
end
```

## Supported

* [Google crawlers](https://support.google.com/webmasters/answer/1061943)
* [Yandex robots](https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.xml)
* [Bingbot](https://blogs.bing.com/webmaster/2012/08/31/how-to-verify-that-bingbot-is-bingbot/)
* [Baidu spider](http://help.baidu.com/question?prod_en=master&class=498&id=1000973)
* [DuckDuckGo bot](https://duckduckgo.com/duckduckbot)
* [Facebook crawler](https://developers.facebook.com/docs/sharing/webmasters/crawler)

## Issues, problems, plans

* Rails middleware
* More testing for Facebook
* Review for thread safety
* Make it possible to reload Facebook IP ranges
* Bots masquerading as someone else, e.g. `Telegram (like Twitter)` - what to do?

## License

Apache 2.0

## References

* I have initially created Play Framework version in Scala: [play-legitbot](https://github.com/osinka/play-legitbot)
* Article [When (Fake) Googlebots Attack Your Rails App](http://jessewolgamott.com/blog/2015/11/17/when-fake-googlebots-attack-your-rails-app/)
* [Voight-Kampff](https://github.com/biola/Voight-Kampff) is a Ruby gem which
  detects bots by `User-Agent`
* [browser](https://github.com/fnando/browser) is a Ruby gem which may tell
  you if the request comes from a search engine.
