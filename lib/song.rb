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
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    out = nil
    self.all.each do |song| 
      if song.name == name
        out = song
      end
    end
    out
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(song)
    artist = song.split(" - ")[0]
    name = song.split(" - ")[1].split(".")[0]
    
    out = self.new
    out.name = name
    out.artist_name = artist
    out
  end
  
  def self.create_from_filename(song)
    out = self.new_from_filename(song)
    out.save
    out
  end
  
  def self.destroy_all
    @@all = []
  end
end
