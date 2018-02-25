require 'pry'

class Song
  attr_accessor :name, :artist_name #makes name and artist name reader and writer
  @@all = [] #all new instances of class will be in this array

  def self.all #makes the array accessible
    @@all
  end

  def save #saves each instance of the class to the class array @@all
    self.class.all << self
  end

  def self.create #Song.create, not assigning song a name
    song = Song.new #create new song, save it, and return it. will be put into @@all
    song.save #referring to def save, and saving it to @@all
    song
  end

  def self.new_by_name(song_name) #self. refers to class constructor
    song = self.new #creating new instance of song
    song.name = song_name #setting song name = to @name
    song #return entire song instance
  end

  def self.create_by_name(song_name)
    song = self.create #referring to def create, which is referring to save, which saves the new song instance to @@all
    song.name = song_name #gives new saved instance a song title (song.name = "song_name")
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
    #refers to self.all method which gives access to @@all array
    #within the array, find song that matches the string argument
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    #uses find_by_name and create_by_name methods, instead of repeating code
    #if the song is found in the array, returns instance of song, otherwise creates a new song instances
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
    #self.all accesses array of all songs, sorts by song name
  end

  def self.new_from_filename(filename)
    song_detail = filename.split(" - ") #splits into array on "-"
    artist_name = song_detail[0] #artist name is 0 index
    song_name = song_detail[1].gsub(".mp3", "") #song name is first index, gsub removes .mp3 and replaces with ""

    song = self.new #creating new instance of song (not referring to another method)
    song.name = song_name #setting name of new instance to new song name
    song.artist_name = artist_name #setting artist of new instance to artist
    song #returns all info of new instance that was created
  end

  def self.create_from_filename(filename)
    song_detail = filename.split(" - ")
    artist_name = song_detail[0]
    song_name = song_detail[1].gsub(".mp3", "")

    song = self.create #refers to self.create method that creates instance and also saves it to @@all
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
