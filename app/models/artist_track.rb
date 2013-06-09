class ArtistTrack < ActiveRecord::Base
  attr_accessible :album_artist, :artist_id, :track_id

  belongs_to :artist
  belongs_to :track


end
