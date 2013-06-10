class Album < ActiveRecord::Base
  attr_accessible :image_url, :name, :description, :album_artist

  belongs_to :artist, :foreign_key => :album_artist, :primary_key => :artist_id
  has_many :tracks, :through => :album_tracks
  # has_many :featured_artists
  # has_many :artists
  # has_many :featured_artists, :through => :album_artists, :class_name => "Artist", :source => :Artist

end
