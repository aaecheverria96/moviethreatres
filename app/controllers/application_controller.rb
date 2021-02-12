require 'sinatra/flash'
require './config/environment'

class ApplicationController < Sinatra::Base
 

  configure do 
    enable :sessions 
    set :public_folder, 'public'
    set :views, 'app/views' 
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash 
  end

  get "/" do
    erb :welcome 
  end  

  get ['/registration','/signup'] do 

    erb :'/users/signup'
  end  

  post '/registrations' do 
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/home'
  end 


   

  get '/search' do  

    erb :search 
  end   

  post '/search' 
    if "#{movie.title}" == true 
      redirect ''

  end 


  



 

  
end

