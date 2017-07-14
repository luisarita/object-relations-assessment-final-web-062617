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
