class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :status, :avatar

  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
  validates_presence_of :user_id, :friend_id

  STATUS = {pending: "pending", accepted: "accepted", declined: "declined", requested: "requested"}

  def self.get_status
    STATUS
  end

  def self.exists?(user,friend)
    not find_by_user_id_and_friend_id(user,friend).nil?
  end

  def self.request(user,friend)
    unless user == friend or Friendship.exists?(user,friend)
      transaction do
        create(:user_id => user, :friend_id => friend, :status => get_status[:pending])
        create(:user_id => friend, :friend_id => user, :status => get_status[:requested])

      end
    end
  end

  def self.accept(user,friend)
  transaction do
    accepted_at = Time.now
    accept_one_side(user, friend, accepted_at)
    accept_one_side(friend, user, accepted_at)
  end
end

def self.breakup(user, friend)
  transaction do
    destroy(find_by_user_id_and_friend_id(user, friend))
  end
end

private

def self.accept_one_side(user, friend, accepted_at)
  request = find_by_user_id_and_friend_id(user,friend)
  request.status = get_status[:accepted]
  # request.accepted_at = accepted_at
  request.save!
end
end
