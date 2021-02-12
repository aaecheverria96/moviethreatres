class Movietheatre < ActiveRecord::Base 
  belongs_to :theatre 
  belongs_to :movie 
  
end
