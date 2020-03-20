class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ") # split it into appropriate pieces
    new_song = self.new(song) # create new song instance
    new_song.artist_name = artist # assign it an artist
    new_song # return the instance
  end
  # Artist - Song Name - Genre.mp3
end
