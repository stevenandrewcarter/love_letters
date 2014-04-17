require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test 'create' do
    profile = Profile.create
    assert profile
  end
end
