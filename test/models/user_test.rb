require 'test_helper'

# Test the User Model
class UserTest < ActiveSupport::TestCase
  test 'create' do
    user = User.create
    assert user
  end
end
