require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test 'search index redirect' do
    get :index, {'id' => 1, 'user_id' => 1}
    assert_response :redirect
  end

  test 'search index' do
    sign_in users(:one)
    get :index, {'id' => 1, 'user_id' => 1}
    assert_response :success
  end

  test 'search index query' do
    sign_in users(:one)
    get :index, {'query' => 'test'}
    assert_response :success
  end
end
