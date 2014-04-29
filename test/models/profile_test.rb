require 'test_helper'

# Test the Profile Model
class ProfileTest < ActiveSupport::TestCase
  test 'create' do
    profile = Profile.create
    assert profile
  end
end
