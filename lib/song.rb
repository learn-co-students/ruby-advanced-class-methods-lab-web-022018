require'pry'
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
    song.save.last
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    # binding.pry
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(file)
    song = self.new
    song.artist_name = file.split(" - ").first
    title = file.split(" - ").last
    song.name = title.split(".").first
    song
  end
  def self.create_from_filename(file)
    artist_name = file.split(" - ").first
    title = file.split(" - ").last
    name = title.split(".").first
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
# binding.pry
