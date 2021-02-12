require 'faker' 

20.times do 
    Movie.create(title: Faker::Movie.title) 
end 