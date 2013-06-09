class AlbumArtist < ActiveRecord::Base
  attr_accessible :album_id, :artist_id
  belongs_to :artist
  belongs_to :album
end
