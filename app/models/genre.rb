class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.all.select {|song| song.genre_id == self.id}.length
  end

  def artists
    Song.all.map {|song| if song.genre_id == self.id then song.artist end}.uniq.compact
  end

  def artist_count
    artists.length
  end

  def all_artist_names
    artists.map {|artist| artist.name}
  end
end
