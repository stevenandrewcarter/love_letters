require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test 'search index redirect' do
    get :index, {'id' => 1, 'user_id' => 1}
    assert_response :redirect
  end

  class LoggedInSearchControllerTest < ActionController::TestCase
    def setup
      sign_in users(:valid_user_test)
    end

    test 'search index' do
      get :index, {'id' => 1, 'user_id' => 1}
      assert_response :success
    end

    test 'search index query' do
      get :index, {'query' => 'test'}
      assert_response :success
    end
  end
end