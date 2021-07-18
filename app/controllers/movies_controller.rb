class MoviesController < ApplicationController

  # GET: /movies
  get "/movies" do
    redirect_if_not_logged_in  
    erb :"/movies/index.html"
  end  

  get "/movies/:id/associate" do 
    redirect_if_not_logged_in 
    movie = Movie.find_by(id: params[:id])
    if current_user.movies.include?(movie)
      current_user.movies.delete(movie)
    else
      current_user.movies << movie
    end
   
    erb :"/user/favorites.html"
  end 

  

  # GET: /movies/new
  get "/movies/new" do 
    redirect_if_not_logged_in  
    movie = Movie.create(params[:movie])
    erb :"movies/new.html"
  end

  # POST: /movies
  post "/movies" do 
    redirect_if_not_logged_in  
    movie = Movie.create(params[:movie])
    
    if movie.save 
    redirect "/movies/#{movie.id}" 
    else 
      redirect "/movies/new" 
    end 

  end

  
  # Get: /movies/display 
  # get "/movies/:title" do  
  #   redirect_if_not_logged_in  
  #   @movie = Movie.find_by(title: params[:title]) 
  #   erb :"/movies/display" 
  # end  

  # GET: /movies/5/edit
  get "/movies/:id/edit" do
    redirect_if_not_logged_in 

    @movie = Movie.find_by(id: params[:id])
    erb :"/movies/edit.html"
  end

  # PATCH: /movies/5
  patch "/movies/:id" do
    redirect_if_not_logged_in 
    movie = Movie.create(params[:movie])
   if  movie.update(params[:movie])
      
      redirect "/movies/#{movie.id}"  
    else 
      
      redirect "/movies/#{movie.id}/edit"
    end 
  end

  # DELETE: /movies/5/delete
  delete "/movies/:id" do 
    redirect_if_not_logged_in 
     
    
    movie = Movie.find_by(id: params[:id]) 
    if movie.destroy 
      redirect "/search" 
      else 
        
      redirect "/movies/#{movie.id}"
    end 
  end 

  get "/movies/:id" do 
    redirect_if_not_logged_in 
   
    @movie = Movie.find_by(id: params[:id])
    erb :"movies/display"
  end  
end
