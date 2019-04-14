class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    Genre.all.map {|genre| if genre.id == self.genre_id then genre.name end}
  end

  def drake_made_this
    self.artist_id = Artist.all.map {|artist| if artist.name == "Drake" then artist.id end}
    # when this method is called it should assign the song's artist to Drake
  end
end
