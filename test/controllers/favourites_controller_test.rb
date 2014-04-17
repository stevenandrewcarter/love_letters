require 'test_helper'

class FavouritesControllerTest < ActionController::TestCase
  test 'favourites index redirect' do
    get :index, {'id' => 1, 'user_id' => 1}
    assert_response :redirect
  end

  test 'favourites index' do
    sign_in users(:one)
    get :index, {'id' => 1, 'user_id' => 1}
    assert_response :success
  end

  test 'favourites create' do
    sign_in users(:one)
    post :create, {'id' => 1, 'user_id' => 1, 'format' => 'json'}
    assert_response :success
  end

  test 'favourites delete' do
    sign_in users(:one)
    delete :destroy, {'id' => 1, 'user_id' => 1, 'format' => 'json'}
    assert_response :success
  end
end
