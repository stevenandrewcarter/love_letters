require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test 'messages index redirect' do
    get :index
    assert_response :redirect
  end

  test 'messages index' do
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test 'messages create' do
    sign_in users(:one)
    post :create, {'message' => {'id' => 1, 'user_id' => 1, 'title' => 'test', 'body' => 'test'}}
    assert_response :redirect
  end

  test 'messages create invalid' do
    sign_in users(:one)
    post :create, {'message' => {'id' => 1, 'user_id' => 1, 'title' => '', 'body' => 'test'}}
    assert_response :success
  end

  test 'messages delete' do
    sign_in users(:one)
    delete :destroy, {'id' => 1, 'user_id' => 1, 'format' => 'json'}
    assert_response :success
  end

  test 'messages new' do
    sign_in users(:one)
    get :new, {'id' => 1, 'user_id' => 1}
    assert_response :success
  end

  test 'messages show' do
    sign_in users(:one)
    get :show, {'id' => 1, 'user_id' => 1}
    assert_response :success
  end
end
