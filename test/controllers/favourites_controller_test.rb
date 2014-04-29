require 'test_helper'

class FavouritesControllerTest < ActionController::TestCase
  test 'favourites index redirect' do
    get :index, {'id' => 1, 'user_id' => 1}
    assert_response :redirect
  end

  class LoggedInFavouritesControllerTest < ActionController::TestCase
    def setup
      sign_in users(:valid_user_test)
    end

    test 'favourites index' do
      get :index, {'id' => 1, 'user_id' => 1}
      assert_response :success
    end

    test 'favourites create' do
      post :create, {'id' => 1, 'user_id' => 1, 'favourite_user_id' => 1, 'format' => 'json'}
      assert_response :success
    end

    test 'favourites delete' do
      delete :destroy, {'id' => 1, 'user_id' => 1, 'favourite_user_id' => 1, 'format' => 'json'}
      assert_response :success
    end
  end
end