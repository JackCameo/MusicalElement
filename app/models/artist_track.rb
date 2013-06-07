class ArtistTrack < ActiveRecord::Base
  attr_accessible :album_artist, :artist_id, :track_id
end
