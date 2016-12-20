[![Gem Version](https://badge.fury.io/rb/legitbot.svg)](https://badge.fury.io/rb/legitbot)

# Legitbot

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

## Issues, problems, plans

* Rails middleware
* Facebook: https://developers.facebook.com/docs/sharing/webmasters/crawler

## License

Apache 2.0

## References

* I have initially created Play Framework version in Scala: [play-legitbot](https://github.com/osinka/play-legitbot)
* Article [When (Fake) Googlebots Attack Your Rails App](http://jessewolgamott.com/blog/2015/11/17/when-fake-googlebots-attack-your-rails-app/)
* [Voight-Kampff](https://github.com/biola/Voight-Kampff) is a Ruby gem which
  detects bots by `User-Agent`
* [browser](https://github.com/fnando/browser) is a Ruby gem which may tell
  you if the request comes from a search engine.
