require 'test_helper'
require 'friendships_controller'

class FriendshipsControllerTest < ActionController::Unit::TestCase

  def setup
    #Raise errors caught by the controller
    @controller = FriendshipsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @user = users(:valid_user)
  end

  def test_create
    #Log in as user and send a friend request
    authorize @user
    get :create, :id => @friend.email
    assert_response :redirect
    assert_redirected_to_profile_for(@friend)
    assert_equal "Friend Request Sent." flash[:notice]
    authorize @friend
    get :accept, :id => @user.email
  end
end
