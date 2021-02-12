class Movie < ActiveRecord::Base 
   has_many :theatres 
   has_many :theatres, through: :movietheatres 

end
