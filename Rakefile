# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'bump/tasks'
require 'rake/testtask'
Bundler::GemHelper.install_tasks

Bump.tag_by_default = true

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.warning = true
  t.verbose = true
end

desc 'Start a console'
task :console do
  require 'irb'
  ARGV.clear
  IRB.start
end

task default: %w[test]
