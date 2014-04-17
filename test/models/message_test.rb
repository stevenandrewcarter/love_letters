require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'create' do
    message = Message.create
    assert message
  end
end
