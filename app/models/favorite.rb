class Favorite < ActiveRecord::Base
    has_many :movies, through: :favorites
end
