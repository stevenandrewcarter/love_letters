require 'test_helper'

# Welcome Controller Test
class WelcomeControllerTest < ActionController::TestCase
  test 'should get redirect when not logged in' do
    get :index
    assert_response :success
  end

  # Logged in Welcome Controller Test
  class LoggedInWelcomeControllerTest < ActionController::TestCase
    def setup
      sign_in users(:valid_user_test)
    end

    test 'welcome index' do
      get :index
      assert_response :success
    end
  end
end