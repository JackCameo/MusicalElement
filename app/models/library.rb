class Library < ActiveRecord::Base
  attr_accessible :album_id, :image, :name, :trakc_id, :user_id
  belongs_to :user

end
