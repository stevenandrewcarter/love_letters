require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test 'profiles show' do
    sign_in users(:one)
    get :show, {'id' => 1, 'user_id' => 1}
    assert_response :success
  end

  test 'profiles update' do
    sign_in users(:one)
    put :update, {'id' => 1, 'user_id' => 1, 'profile' => {'first_name' => 'test'}}
    assert_response :redirect
  end
end
