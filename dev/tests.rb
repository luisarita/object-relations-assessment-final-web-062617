viewer1 = Viewer.new('Viewer', '#1')
viewer2 = Viewer.new('Viewer', '#2')
movie1 = Movie.new("Title #1")
movie2 = Movie.new("Title #2")
#rating = Rating.new()

puts "Test #1: Returns all viewers"
puts Viewer.all

puts "Test #2: Finds by full name"
puts Viewer.find_by_name("Viewer #1").full_name

puts "Test #3: Doesn't find if does not exist"
puts Viewer.find_by_name("Viewer #3").nil?

puts "Test #4: Can create a rating"
puts viewer1.create_rating(movie1, 5)

puts "Test #5: Returns all the ratings"
puts Rating.all.count

puts "Test #6: Returns the viewer for that given rating"
puts Rating.all.first.viewer
  
puts "Test #7: Returns the movie for that given rating"
puts Rating.all.first.movie

puts "Test #8: Returns all movies"
puts Movie.all

puts "Test #9: Find by title"
puts Movie.find_by_title("Title #1")

puts viewer2.create_rating(movie1, 1)
puts "Test #10: returns an array of all ratings for that movie"
puts movie1.ratings

puts "Test #11: returns an array of all viewers for that movie"
puts movie1.viewers

puts "Test #12: should return the average of all of the scores for the ratings of that particular movie."
puts movie1.average_rating

puts "Test #13: should return nil for a moview without ratings."
puts movie2.average_rating