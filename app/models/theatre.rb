class Theatre < ActiveRecord::Base 
    has_many :users 
    has_many :movies 
    has_many :users, through: :usertheatres 
    has_many :movies, through: :movietheatres 
    
end
