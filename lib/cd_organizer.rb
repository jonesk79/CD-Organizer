class Cd
  attr_reader :album_name, :artist_name, :cd_array

  @@cd_array = []

  def initialize(attributes)
    @album_name = attributes[:album_name]
    @artist_name = attributes[:album_artist]
    @@cd_array << self
  end

  def Cd.all
    @@cd_array
  end

  def Cd.clear
    @@cd_array = []
  end

  def Cd.search(search_term)
    @@cd_array.select {|album| album.album_name == search_term || album.artist_name == search_term}
  end

  def Cd.list_artists
    artists = []
    Cd.all.each do |artist|
    artists.push(artist.instance_variable_get(:@artist_name))
    end

    artists.uniq.each_with_index do |artist, index|
      print (index + 1).to_s + ": " + artist + "\n"
    end

  end
end
