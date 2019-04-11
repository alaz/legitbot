# encoding: utf-8
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "legitbot/version"

Gem::Specification.new do |spec|
  spec.name = 'legitbot'
  spec.version = Legitbot::VERSION
  spec.license = 'Apache-2.0'

  spec.author = "Alexander Azarov"
  spec.email = "self@alaz.me"
  spec.homepage = "https://github.com/alaz/legitbot"
  spec.summary = %q{Validate requests from Web crawlers: impersonating or not?}
  spec.description = "A library to make sure a Web request has been "\
    "made by a real search engine, not a malicious agent"

  spec.required_ruby_version = '>= 2.3.0'
  spec.add_dependency "irrc", ">= 0.2.1"
  spec.add_dependency "augmented_interval_tree", ">= 0.1.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"

  spec.files = `git ls-files`.split($/)
  spec.rdoc_options = ["--charset=UTF-8"]
  spec.test_files = Dir.glob("test/**/*")
end
