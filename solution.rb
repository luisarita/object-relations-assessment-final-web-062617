# Please copy/paste all three classes into this file to submit your solution!

class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
    self.class.all << self
  end

  # should return all of the viewers
  def self.all
    @@all
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

  # given a string of a full name, returns the first customer whose full name matches
  def self.find_by_name(full_name)
    self.all.find {|viewer| viewer.full_name == full_name }
  end

  # given a score and a movie, creates a new Rating and associates it with that viewer and that movie
  def create_rating(movie, score)
    Rating.new(movie, self, score)
  end
end


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

class Rating
  attr_accessor :score

  @@all = []

  def initialize(movie, viewer, score)
    @movie, @viewer, @score = movie, viewer, score
    self.class.all << self
  end

  # returns all of the ratings
  def self.all
    @@all
  end

  # returns the viewer for that given rating
  attr_reader :viewer
  
  # returns the movie for that given rating
  attr_reader :movie
end

