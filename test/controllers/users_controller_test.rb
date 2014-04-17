require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'users show' do
    sign_in users(:one)
    get :show, {'id' => 1}
    assert_response :success
  end
end
