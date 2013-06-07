class Artist < ActiveRecord::Base
  attr_accessible :age, :birthdate, :first_name, :last_name, :name

  has_many :tracks, :through => :artist_track
  has_many :artist_track
end
