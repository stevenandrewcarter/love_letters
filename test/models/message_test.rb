require 'test_helper'

# Test the Message Model
class MessageTest < ActiveSupport::TestCase
  test 'create' do
    message = Message.create
    assert message
  end
end
