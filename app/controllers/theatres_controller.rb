class TheatresController < ApplicationController

  # GET: /theatres
  get "/theatres" do
    erb :"/theatres/index.html"
  end

  # GET: /theatres/new
  

  # POST: /theatres
  

  # GET: /theatres/5
  get "/theatres/:id" do
    erb :"/theatres/show.html"
  end

  # GET: /theatres/5/edit
  get "/theatres/:id/edit" do
    erb :"/theatres/edit.html"
  end

  # PATCH: /theatres/5
  patch "/theatres/:id" do
    redirect "/theatres/:id"
  end

  # DELETE: /theatres/5/delete
  delete "/theatres/:id/delete" do
    redirect "/theatres"
  end
end
