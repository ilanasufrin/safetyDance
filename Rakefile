require 'sinatra/activerecord/rake'
require './config/environment'

desc 'Open console'
task :console do
  require 'pry'
  Pry.start
end

desc 'Make a migration'
task :migrate do
  ARGV.shift

  datestamp = Time.now.strftime('%Y%m%d%H%M%S')
  migration_name = ARGV.dup.unshift(datestamp).join('_')
  class_name = ARGV.dup.map{ |word| word.capitalize }.join

  filename = File.join(File.dirname(__FILE__), 'db', 'migrate', "#{migration_name}.rb")
  code = <<-RUBY
class #{class_name} < ActiveRecord::Migration
  def change

  end
end
RUBY

  File.open(filename, "w") do |f|
    f.puts code
  end

  # https://stackoverflow.com/a/17671913/2396058
  ARGV.each do |arg|
    task arg.to_sym do ; end
  end
end
