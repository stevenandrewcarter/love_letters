require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test 'messages index redirect' do
    get :index
    assert_response :redirect
  end

  class AuthenticatedMessagesControllerTest < ActionController::TestCase
    def setup
      sign_in users(:valid_user_test)
    end

    test 'messages index' do
      get :index
      assert_response :success
    end

    test 'messages create' do
      post :create, {'message' => {'id' => 1, 'user_id' => 1, 'title' => 'test', 'body' => 'test'}}
      assert_response :redirect
    end

    test 'messages create invalid' do
      post :create, {'message' => {'id' => 1, 'user_id' => 1, 'title' => '', 'body' => 'test'}}
      assert_response :success
    end

    test 'messages delete' do
      delete :destroy, {'id' => 1, 'user_id' => 1, 'format' => 'json'}
      assert_response :success
    end

    test 'messages new' do
      get :new, {'id' => 1, 'user_id' => 1}
      assert_response :success
    end

    test 'messages show' do
      get :show, {'id' => 1, 'user_id' => 1}
      assert_response :success
    end
  end
end