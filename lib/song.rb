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
    song = Song.new
    all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    all << song
    song
  end

  def self.find_by_name(name)
    all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)
    x = self.create_by_name(name) if x.nil?
    x
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = filename.split(' - ')
    song = self.new_by_name(song_info[1].chomp('.mp3'))
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    all << song
    song
  end

  def self.destroy_all
    all.clear
  end



end
