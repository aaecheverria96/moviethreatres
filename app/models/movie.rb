class Movie < ActiveRecord::Base 
   validates_presence_of :title, :duration
   has_many :movietheatres
   has_many :theatres, through: :movietheatres 
   has_many :favorites 
   has_many :users, through: :favorites 
   

end
