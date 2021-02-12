class SessionsController < ApplicationController 
    
    get '/login' do 

        erb :'registrations/login'
      end 
    
    post '/login' do
        user = User.find_by(email: params["email"])
    
        if user && user.authenticate(params["password"]) 
            session[:user_id] = user.id
            redirect "/users/#{user.id}" 
        else 
            flash[:error] = "Invalid login" 
            redirect '/login' 
        end 
    end 
    
    get '/logout' do #flash message for successfull logout 
        session.clear
        redirect '/'
     
    end 
end 