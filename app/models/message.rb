class Message < ActiveRecord::Base
  has_one :sent_message
  has_one :received_message

  validates :title, presence: true
end
