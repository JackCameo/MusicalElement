class FriendshipsController < ApplicationController
  before_filter :authenticate_user!, :setup_friends

  def friend_request
    Friendship.request(current_user.id, params[:id])
    flash[:notice] = "Friendship request sent!"
    redirect_to root_url
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(current_user.id, params[:id])
      flash[:notice] = "Friendship with {@friend.email} accepted!"
    else
      flash[:notice] = "No friendship request from that person."
    end
    redirect_to root_url
  end

  def decline
     binding.pry
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user.id, @friend.id)
      flash[:notice] = "Friendship with #{@friend.email} declined."
    else
      flash[:notice] = "No friendship request from that person."
    end
    redirect_to root_url
end

def cancel
  if @user.pending_friends.include?(@friend)
    Friendship.breakup(@user.id, @friend.id)
    flash[:notice] = "Friendship request canceled."
  else
    flash[:notice] = "No request for friendship with that person."
  end
  redirect_to root_url
end

def delete

  if @user.friends.include?(@friend)
    Friendship.breakup(@user.id, @friend.id)
    flash[:notice] = "Friendship with #{@friend.email} deleted"
  else
    flash[:notice] = "You arent friends with that person."
  end
  redirect_to root_url
end

  def create
    Friendship.request(@user.id, @friend.id)
    flash[:notice] = "Friend Request Sent"
    redirect_to root_url
  end

  private
    def setup_friends
      @user = current_user
      @friend = User.find(params[:id]) if params[:id]

end
end
