class UsersController < ApplicationController 


    get '/signup' do 
        erb :'users/signup'
    end 

    post '/users' do 
        
        user = User.new 
        user.email = params[:email] 
        user.password = params[:password] 
        user.username = params[:username] 
        if user.save 
            redirect '/login' 
        else 
            erb :'users/signup'
        end 
    end 

    get '/users/home' do

        @user = User.find(session[:user_id])
        erb :'/users/home'
      end   
    
end 