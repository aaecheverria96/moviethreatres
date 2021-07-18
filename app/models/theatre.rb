class Theatre < ActiveRecord::Base 
    validates_presence_of :name 
    has_many :userstheatres
    has_many :movietheatres
    has_many :users, through: :usertheatres 
    has_many :movies, through: :movietheatres 
    
end
