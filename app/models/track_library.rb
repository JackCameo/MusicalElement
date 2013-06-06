class TrackLibrary < ActiveRecord::Base
  attr_accessible :library_id, :track_id

  belongs_to :library
  belongs_to :track
end
