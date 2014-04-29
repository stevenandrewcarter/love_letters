require 'test_helper'

# Dashboard Controller Test
class DashboardControllerTest < ActionController::TestCase
  def setup
    sign_in users(:valid_user_test)
  end

  test 'dashboard index' do
    get :index, 'id' => 1, 'user_id' => 1
    assert_response :success
  end
end
