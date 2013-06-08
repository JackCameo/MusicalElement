class Artist < ActiveRecord::Base
  attr_accessible :age, :birthdate, :first_name, :last_name, :name

  # belongs_to :track

  has_many :tracks, :through => :artist_tracks
  has_many :artist_tracks

  def exists
  end

end
