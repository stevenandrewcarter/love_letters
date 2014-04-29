require 'test_helper'

# Events Controller Test
class EventsControllerTest < ActionController::TestCase
  test 'events index success' do
    get :index
    assert_response :success
  end

  # Logged In Events Controller Test
  class LoggedInEventsControllerTest < ActionController::TestCase
    def setup
      sign_in users(:valid_user_test)
    end

    test 'events index' do
      get :index, 'user_id' => 1
      assert_response :success
    end

    test 'events show' do
      get :index, 'id' => 1, 'user_id' => 1
      assert_response :success
    end

    test 'events create' do
      post :create, 'id' => 1, 'user_id' => 1, 'event' => {'name' => 'create_test'}
      assert_response :success
    end

    test 'events delete' do
      delete :destroy, 'id' => 1, 'user_id' => 1, 'favourite_user_id' => 1, 'format' => 'json'
      assert_response :success
    end
  end
end
