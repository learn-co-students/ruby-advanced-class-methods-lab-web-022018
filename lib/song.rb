require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      return Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    array = filename.split " - "
    out = Song.new_by_name(array[1])
    out.artist_name = array[0]
    out
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end
