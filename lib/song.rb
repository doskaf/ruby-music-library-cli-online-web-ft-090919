require 'pry'

class Song
  
  attr_accessor :name, :artist
  
  def artist=(artist)
    
  end
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
end