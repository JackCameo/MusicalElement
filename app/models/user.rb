class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :age, :name, :library_id, :avatar, :status

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://community.nasdaq.com/common/images/defaultUserAvatar.jpg"
  letsrate_rater


  has_one :library
  has_many :friendships
  has_many :tracks
  has_many :comments
  has_many :user_playlists
  has_many :playlists, :through => :user_playlists

  has_many :friends,
  :through => :friendships,
  :conditions => "status = 'accepted'",
  :order => :email

  has_many :requested_friends,
    :through => :friendships,
    :source => :friend,
    :conditions => "status = 'requested'",
    :order => :created_at

  has_many :pending_friends,
    :through => :friendships,
    :source => :friend,
    :conditions => "status = 'pending'",
    :order => :created_at
  end





