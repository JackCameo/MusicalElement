class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id

  belongs_to :friend
  belongs_to :user
end
