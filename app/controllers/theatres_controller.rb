class TheatresController < ApplicationController

  # GET: /theatres
  get "/theatres" do
    redirect_if_not_logged_in
    erb :"/theatres/index.html"
  end
 
 
  get "/theatres/display/movies/:id" do 
    redirect_if_not_logged_in 
    
    @movie = Movie.find_by(id: params[:id]) 
    @theatres = @movie.theatres 
      # erb :"theatres/display"  
      if @theatres.length > 0 
        erb :"/theatres/display" 
      else 
        erb :"/movies/error.html"
      end 
  end 
  
  get "/theatre/:id/movies/:movie_id" do 
    redirect_if_not_logged_in 
    @theatre = Theatre.find_by_id(id: params[:id]) 
    
    @movies = Movie.find_by(id: params[:movie_id]) 
   
    if @theatre && @theatre.movies.include?(@movies)
      erb :"/theatres/movie" 
    else 
      erb :"/theatres/error.html" 
    end 
  end 

   

  # GET: /theatres/5
  get "/theatres/:id" do
    redirect_if_not_logged_in 
  
    @theatre = Theatre.find_by(id: params[:id]) 
   
    @movies = @theatre.movies 
    erb :"/theatres/show.html"
  end

  # GET: /theatres/5/edit
  get "/theatres/:id/edit" do
    redirect_if_not_logged_in
    erb :"/theatres/edit.html"
  end

  # PATCH: /theatres/5
  patch "/theatres/:id" do
    redirect_if_not_logged_in
    redirect "/theatres/:id"
  end

  # DELETE: /theatres/5/delete
  delete "/theatres/:id/delete" do
    redirect_if_not_logged_in
    redirect "/theatres"
  end
end
