require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'should get redirect when not logged in' do
    get :index
    assert_response :success
  end

  test 'welcome index' do
    sign_in users(:one)
    get :index
    assert_response :success
  end
end
