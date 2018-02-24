require 'pry'
class Song
  attr_accessor :name, :artist_name
  def initialize
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all.last
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    @@all << Song.new_by_name(title)
    @@all.last

  end

  def self.find_by_name(title)
    Song.all.find {|song| song.name == title}

  end

  def self.find_or_create_by_name(title)
    !!Song.find_by_name(title)?  Song.find_by_name(title) : Song.create_by_name(title)
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    file = file.split(".")
    file[0] = file[0].split(" - ").flatten
    song = Song.new
    song.artist_name = file[0][0]
    song.name = file[0][1]
    song
  end

  def self.create_from_filename(file)
    @@all << Song.new_from_filename(file)
    @@all.last
  end

  def self.destroy_all
  @@all = []
  end

end
