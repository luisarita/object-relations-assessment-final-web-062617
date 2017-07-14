class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    self.class.all << self
  end

  # returns an array of all movies
  def self.all
    @@all
  end

  # given a string of movie title, returns the first movie that matches
  def self.find_by_title(title)
    self.all.find {|movie| movie.title == title}
  end

  # returns an array of all ratings for that movie
  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  # should return all of the viewers who have left ratings for that movie.
  def viewers
    ratings.map(&:viewer)
  end
  
  # should return the average of all of the scores for the ratings of that particular movie.
  def average_rating
    # store the ratings into a variable; this will prevent #ratings from being called twice, which would increase run time
    this_ratings = ratings

    # count elements to prevent division by zero, in which nil is returned (a movie with no ratings does not mean that it has a zero average)
    return nil unless this_ratings.count > 0
    
    # add up all the scores and return the division by zero
    sum = this_ratings.map(&:score).reduce(0, :+)
    sum / this_ratings.count
  end
end
