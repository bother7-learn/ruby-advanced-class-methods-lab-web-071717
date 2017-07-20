require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

def initialize(name=nil, artist=nil)
# @@all << self
@name = name
@artist_name = artist
end

# def artist_name= (name)
# @artist_name = name
# end

def self.all
  @@all
end

def save
  self.class.all << self
end

def self.create
song = self.new
song.save
# binding.pry
##  self.save
  # self.all << self
## binding.pry
song
end

def self.new_by_name(name)
  self.new(name)

end

def self.create_by_name(name)
song = self.new(name)
song.save
song
# @@all << self
end

def self.find_by_name(name)
  ##binding.pry
  chosen = @@all.select do |song|
    song.name == name
  end[0]
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    self.create_by_name(name)
  end
end

def self.alphabetical
@@all.sort_by {|song| song.name}
  # binding.pry

end


def self.new_from_filename(file)
array = file.split(" - ")
array[1].sub!(".mp3", "")
# binding.pry
self.new(array[1], array[0])

# self.artist_name = array[0]

  # binding.pry


end

def self.create_from_filename(file)
  array = file.split(" - ")
  array[1].sub!(".mp3", "")
  # binding.pry
  song = self.new(array[1], array[0])
song.save
song
  # self.artist_name = array[0]

    # binding.pry

end

def self.destroy_all
  @@all = []
end


end
