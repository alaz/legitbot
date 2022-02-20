# frozen_string_literal: true

desc 'Start a console'
task :console do
  require 'irb'
  ARGV.clear
  IRB.start
end
