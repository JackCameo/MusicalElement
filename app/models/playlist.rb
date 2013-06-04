class Playlist < ActiveRecord::Base
  attr_accessible :name, :position, :track_id, :user_id

  has_many :user_playlists
  has_many :users, :through => :user_playlists


end
