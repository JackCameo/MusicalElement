class Friend < ActiveRecord::Base
  attr_accessible :image_url, :name

  has_many :friendships
  has_many :users, :through => :friendships
end
