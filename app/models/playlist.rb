class Playlist < ActiveRecord::Base
  attr_accessible :name, :position, :track_id, :user_id, :library_id

  belongs_to :library
  has_many :user_playlists 
  has_many :comments
  has_many :users, :through => :user_playlists

  def included

    binding.pry
  end


end
