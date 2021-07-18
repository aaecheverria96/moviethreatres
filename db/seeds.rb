require 'faker' 


movie = Movie.create(title) 
theatre = Theatre.create(name) 
Movietheatre.create(movie: movie, theatre: theatre) 

20.times do 
   movie = Movie.create(title: Faker::Movie.title) 
end  

i = 11
while i < 21
   Movietheatre.create(movie: Movie.find(i), theatre_id: 2) 
   i += 1
end 


