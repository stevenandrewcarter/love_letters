require 'test_helper'

# Products Controller Test
class ProductsControllerTest < ActionController::TestCase
  test 'Products index success' do
    get :index
    assert_response :success
  end
end
