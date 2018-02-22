require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.each do |song|
      if song.name == title
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      song = self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(file)
    song_data = file.split(".").map {|string| string.split(" - ")}
    song_data = song_data.flatten
    song = self.new_by_name(song_data[1])
    song.artist_name = song_data[0]
    song
  end

  def self.create_from_filename(file)
    song_data = file.split(".").map {|string| string.split(" - ")}
    song_data = song_data.flatten
    song = create_by_name(song_data[1])
    song.artist_name = song_data[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end 



end
