require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create' do
    user = User.create
    assert user
  end
end
