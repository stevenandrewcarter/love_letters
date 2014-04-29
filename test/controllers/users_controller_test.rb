require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    sign_in users(:valid_user_test)
  end

  test 'users show' do
    get :show, {'id' => 1}
    assert_response :success
  end
end
