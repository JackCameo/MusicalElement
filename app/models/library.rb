class Library < ActiveRecord::Base
  attr_accessible :album_id, :image, :name, :track_id, :user_id

  belongs_to :user
  has_many :tracks, :through => :track_library
  has_many :track_library

end
