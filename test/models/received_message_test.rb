require 'test_helper'

# Test the ReceivedMessage Model
class ReceivedMessageTest < ActiveSupport::TestCase
  test 'create' do
    received_message = ReceivedMessage.create
    assert received_message
  end
end
