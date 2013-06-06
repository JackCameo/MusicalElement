class Album < ActiveRecord::Base
  attr_accessible :image_url, :name

  belongs_to :artist
  has_many :tracks, :through => :albums_tracks
end
