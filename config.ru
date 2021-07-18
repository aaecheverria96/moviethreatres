require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# run ApplicationController  #when you run shotgun this is the first file that will be read #control z used to quit                             
use Rack::MethodOverride
use SessionsController 
use TheatresController 
use UsersController 
use MoviesController
run ApplicationController
