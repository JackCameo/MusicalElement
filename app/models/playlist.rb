class Playlist < ActiveRecord::Base
  attr_accessible :name, :position, :track_id, :user_id
end
