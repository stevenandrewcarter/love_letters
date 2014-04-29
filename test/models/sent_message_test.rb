require 'test_helper'

# Test the SentMessage Model
class SentMessageTest < ActiveSupport::TestCase
  test 'create' do
    sent_message = SentMessage.create
    assert sent_message
  end
end
