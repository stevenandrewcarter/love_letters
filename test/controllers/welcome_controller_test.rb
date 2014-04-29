require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'should get redirect when not logged in' do
    get :index
    assert_response :success
  end

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