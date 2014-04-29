require 'test_helper'

# Users Controller Test
class UsersControllerTest < ActionController::TestCase
  def setup
    sign_in users(:valid_user_test)
  end

  test 'users show' do
    get :show, 'id' => 1
    assert_response :success
  end
end
