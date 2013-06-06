class Comment < ActiveRecord::Base
  attr_accessible :body, :playlist_id, :user_id

  belongs_to :playlist
  belongs_to :user
end
