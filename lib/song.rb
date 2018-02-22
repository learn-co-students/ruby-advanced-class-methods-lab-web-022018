
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

  def self.new_by_name(string)
    new_song = self.new
    new_song.name = string
    new_song
  end

  def self.create_by_name(string)
    song = self.new
    song.name = string
    song.save
    song
  end

  def self.find_by_name(string)
    song_object = nil
    @@all.each do |song|
      if song.name == string
        song_object = song
      end
    end
    song_object
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) == nil ? self.create_by_name(song_name)
    : self.find_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name[0] }
  end

  def self.new_from_filename(file_name)
    array = file_name.split(/[-.]/)
    array.delete(array.last)
    song = array.collect { |i| i.strip}
    new_song = self.new_by_name(song[1])
    new_song.artist_name = song[0]
    new_song
    # new_song = self.create_by_name(song[1])
    # new_song.artist_name = song[0]
    # new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end


  def self.destroy_all
    @@all = []
  end

end
