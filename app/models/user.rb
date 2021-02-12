class User < ActiveRecord::Base  #gives 500 methods some are macros has many, belongs to 
    validates_presence_of :username, :email 
    has_many :usertheatres
    has_many :theatres, through: :usertheatres 
    has_secure_password 

end
