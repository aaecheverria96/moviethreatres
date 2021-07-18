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

    post '/registrations' do 
        user = User.new(name: params["name"], email: params["email"], password: params["password"])
        if user.save
            session[:user_id] = @user.id
            flash[:success] = "User successfully created"
            redirect '/users/home' 
        else 
            flash[:error] = user.errors.full_messages.to_sentence 
            redirect '/signup'
        end 
    end 
    
   
   

    get '/users/favorites' do 
        redirect_if_not_logged_in
    #    @favorites = current_user.movies
        erb :'users/favorites.html'
    end 
    


    get '/users/home' do

        erb :'/users/home'
      end   
    
end 