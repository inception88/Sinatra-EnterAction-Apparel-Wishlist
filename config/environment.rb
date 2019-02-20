require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/database.sqlite")

# configure :development do
# 	set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}
# end
require_all 'app'
