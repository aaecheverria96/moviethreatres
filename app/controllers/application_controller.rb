require 'sinatra/flash'
require './config/environment' 
require 'pry'

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

  error Sinatra::NotFound do 
    erb :"error.html" 
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
    if false 

      if true 

        if Movie.find_by(title: params[:title]) == true 
          redirect '/theatres/display'
        elsif Theatre.find_by(name: params[:name]) == true 
          redirect '/movies/display'  
        end 
      end 
      else 
      erb :search 
    end 
  end   

  # get '/search' do 
  
  # if false
  
  #   if true 
    
     
  #     if Movie.find_by(title) == true || Theatre.find_by(name) == true 
  #       redirect '/users/display'
  #     end 
      
  #       else 
  #       erb :search 
    
  #   end 
  # end 




end 


  



 

  


