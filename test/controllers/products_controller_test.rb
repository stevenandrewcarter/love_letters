require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test 'Products index success' do
    get :index
    assert_response :success
  end
end
