class ArtistTrack < ActiveRecord::Base
  attr_accessible :album_artist, :artist_id, :track_id, :artists_attributes, :tracks_attributes

  belongs_to :artist
  belongs_to :track

  accepts_nested_attributes_for :artists
  accepts_nested_attributes_for :tracks
end
