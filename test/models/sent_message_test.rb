require 'test_helper'

class SentMessageTest < ActiveSupport::TestCase
  test 'create' do
    sent_message = SentMessage.create
    assert sent_message
  end
end
