require "pry"

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
    # self.all << self.new
    song = self.new
    self.all << song
    song
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if name
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        create_by_name(name)
      end
    else
      create
    end
  end

  def self.alphabetical
    self.all.sort! {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(name)
    if name.include?("-")
      name = name.split("-")
      artist = name[0].split.join
      name[-1] = name[-1].split(".") if name[-1].include?(".")
      song = create_by_name(name[-1][0].split.join(" "))
      song.artist_name = artist
      song
    end
  end

  def self.create_from_filename(name)
    name = name.split("-")
    artist = name[0].split.join
    name[-1] = name[-1].split(".") if name[-1].include?(".")
    song = create_by_name(name[-1][0].split.join(" "))
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

# binding.pry
end
