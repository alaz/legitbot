# frozen_string_literal: true

require 'English'

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'legitbot/version'

Gem::Specification.new do |spec|
  spec.name = 'legitbot'
  spec.version = Legitbot::VERSION
  spec.license = 'Apache-2.0'

  spec.author = 'Alexander Azarov'
  spec.email = 'self@alaz.me'
  spec.homepage = 'https://github.com/alaz/legitbot'
  spec.summary = 'Validate requests from Web crawlers: impersonating or not?'
  spec.description = 'Does Web request come from a real search engine or from an impersonating agent?'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.required_ruby_version = '>= 2.6.0'
  spec.add_dependency 'fast_interval_tree', '~> 0.2', '>= 0.2.2'
  spec.add_dependency 'irrc', '~> 0.2', '>= 0.2.1'
  spec.add_development_dependency 'bump', '~> 0.8', '>= 0.8.0'
  spec.add_development_dependency 'dns_mock', '~> 1.5.0', '>= 1.5.0'
  spec.add_development_dependency 'minitest', '~> 5.1', '>= 5.1.0'
  spec.add_development_dependency 'minitest-hooks', '~> 1.5', '>= 1.5.0'
  spec.add_development_dependency 'nokogiri', '~> 1.13.0', '>= 1.13.0'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.0'
  spec.add_development_dependency 'rubocop', '~> 1.24.0', '>= 1.24.0'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.17.0', '>= 0.17.0'

  spec.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.rdoc_options = ['--charset=UTF-8']
  spec.test_files = Dir.glob('test/**/*').reject { |f| f.start_with? 'test/lib' }
end
