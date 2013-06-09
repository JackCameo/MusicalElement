class UserPlaylist < ActiveRecord::Base
  attr_accessible :playlist_id, :user_id
  
  belongs_to :track
  belongs_to :user

end
