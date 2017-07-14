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
