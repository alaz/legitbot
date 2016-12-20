require 'rubygems'
require 'bundler'

Bundler::GemHelper.install_tasks

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.warning = true
  t.verbose = true
end

task default: %w[test]
