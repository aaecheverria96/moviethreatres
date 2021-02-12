ENV['SINATRA_ENV'] ||= "development"
require 'sinatra/flash'
require 'bundler/setup' 
require 'dotenv/load'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )
configure :development do 
  set :database, "sqlite3:db/#{ENV['SINATRA_ENV']}.sqlite"
end 


require_all 'app'
