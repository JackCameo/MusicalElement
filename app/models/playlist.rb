class Playlist < ActiveRecord::Base
  attr_accessible :name, :position, :user_id, :library_id, :private

  belongs_to :library
  has_many :user_playlists 
  has_many :comments
  has_many :tracks, :through => :playlist_tracks
  has_many :playlist_tracks
  has_many :users, :through => :user_playlists

  def included

    binding.pry
  end


end