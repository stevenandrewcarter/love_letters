require 'test_helper'

# Profile Controller Test
class ProfileControllerTest < ActionController::TestCase
  def setup
    sign_in users(:valid_user_test)
  end

  test 'profiles show' do
    get :show, 'id' => 1, 'user_id' => 1
    assert_response :success
  end

  test 'profiles update' do
    put :update, 'id' => 1, 'user_id' => 1, 'profile' => {'first_name' => 'test'}
    assert_response :success
  end
end
