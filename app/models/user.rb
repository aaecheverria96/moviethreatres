class User < ActiveRecord::Base  
    validates_presence_of :username, :email 
    validates_uniqueness_of :username, :email 
    has_many :usertheatres
    has_many :theatres, through: :usertheatres 
    has_many :favorites 
    has_many :movies, through: :favorites
    has_secure_password 

end
