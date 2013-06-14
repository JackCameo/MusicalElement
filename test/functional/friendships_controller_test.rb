require 'test_helper'
require 'friendships_controller'

class FriendshipsControllerTest < ActionController::Unit::TestCase

  def setup
    @controller = FriendshipsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @user = users(:valid_user)
  end

end
