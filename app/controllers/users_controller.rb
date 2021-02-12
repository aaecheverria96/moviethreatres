class UsersController < ApplicationController 


    get '/signup' do 
        erb :'users/signup'
    end 

    post '/users' do 
        
        user = User.new 
        user.email = params[:email] 
        user.password_digest = params[:password] 
        if user.save 
            redirect '/login' 
        else 
            erb :'users/signup'
        end 
    end 

    
end 