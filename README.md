# Legitbot [![Build Status](https://secure.travis-ci.org/alaz/legitbot.png?branch=master)](http://travis-ci.org/alaz/legitbot) [![Gem Version](https://badge.fury.io/rb/legitbot.svg)](https://badge.fury.io/rb/legitbot)

Ruby gem to check that an IP belongs to a bot, typically a search
engine. This can be of help in protecting a web site from fake search
engines.

## Usage

Suppose you have a Web request and you'd like to make sure it's not from a fake
search engine:

```ruby
bot = Legitbot.bot(userAgent, ip)
```

`bot` will be `nil` if no bot signature was found in the `User-Agent`. Otherwise,
it will be an object with methods

```ruby
bot.detected_as # => :google
bot.valid? # => true
bot.fake? # => false
```

Sometimes you already know what search engine to expect. For example, you might
be using [rack-attack](https://github.com/kickstarter/rack-attack):

```ruby
Rack::Attack.blocklist("fake Googlebot") do |req|
  req.user_agent =~ %r(Googlebot) && Legitbot::Google.fake?(req.ip)
end
```

Or if you do not like all these nasty crawlers stealing your content or
maybe evaluating it and getting ready to invade your site with spammers,
then block them all:

```ruby
Rack::Attack.blocklist 'fake search engines' do |request|
  Legitbot.bot(request.user_agent, request.ip)&.fake?
end
```

## Supported

* [Ahrefs](https://ahrefs.com/robot)
* [Applebot](https://support.apple.com/en-us/HT204683)
* [Baidu spider](http://help.baidu.com/question?prod_en=master&class=498&id=1000973)
* [Bingbot](https://blogs.bing.com/webmaster/2012/08/31/how-to-verify-that-bingbot-is-bingbot/)
* [DuckDuckGo bot](https://duckduckgo.com/duckduckbot)
* [Facebook crawler](https://developers.facebook.com/docs/sharing/webmasters/crawler)
* [Google crawlers](https://support.google.com/webmasters/answer/1061943)
* [Pinterest](https://help.pinterest.com/en/articles/about-pinterest-crawler-0)
* [Twitterbot](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started), the list of IPs is in the [Troubleshooting page](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/troubleshooting-cards)
* [Yandex robots](https://yandex.com/support/webmaster/robot-workings/check-yandex-robots.xml)

## License

Apache 2.0

## References

* Play Framework variant in Scala: [play-legitbot](https://github.com/osinka/play-legitbot)
* Article [When (Fake) Googlebots Attack Your Rails App](http://jessewolgamott.com/blog/2015/11/17/when-fake-googlebots-attack-your-rails-app/)
* [Voight-Kampff](https://github.com/biola/Voight-Kampff) is a Ruby gem that
  detects bots by `User-Agent`
* [crawler_detect](https://github.com/loadkpi/crawler_detect) is a Ruby gem and Rack
  middleware to detect crawlers by few different request headers, including `User-Agent`
