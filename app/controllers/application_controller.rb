require 'sinatra/flash'
require './config/environment'

class ApplicationController < Sinatra::Base
 

  configure do 
    enable :sessions 
    set :public_folder, 'public'
    set :views, 'app/views' 
    set :session, "secret" 
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


  

  get '/users/home' do

    @user = User.find(session[:user_id])
    erb :'/users/home'
  end   

  



 

  
end

