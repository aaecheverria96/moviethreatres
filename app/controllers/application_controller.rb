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

  get ['/signin', '/access'] do 
    redirect '/login'
  end   

  helpers do 
    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def logged_in? 
      !!current_user
    end  

    def redirect_if_not_logged_in 
      if !logged_in? 
        redirect '/login' 
      end 
    end 
  


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


   

  post '/results' do  
  

     movie = Movie.find_by(title: params[:movie].strip) 
    theatre = Theatre.find_by(name: params[:theater].capitalize.strip)
   
        if movie && theatre 
           
          redirect "/theatre/#{theatre.id}/movies/#{movie.id}" 
        elsif theatre 
          redirect "/theatres/#{theatre.id}"  
        elsif movie 
          redirect "/theatres/display/movies/#{movie.id}" 
        else  
          redirect "/search"
        end 
      end   

      

  
      
      get "/search" do 
        erb :search 
    
      end 





end 


  



 

  


