require "./config/environment"
require "sinatra/activerecord/rake"

desc 'Clean Database'
task :clean do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end
