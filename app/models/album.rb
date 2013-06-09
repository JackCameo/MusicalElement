class Album < ActiveRecord::Base
  attr_accessible :image_url, :name, :description

  belongs_to :artist
  has_many :tracks, :through => :album_tracks
  # has_many :featured_artists
  has_many :artists
  has_many :featured_artists, :through => :album_artists, :class_name => "Artist", :source => :Artist

end
