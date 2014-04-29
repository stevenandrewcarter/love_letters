require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  test 'Services index success' do
    get :index
    assert_response :success
  end
end
