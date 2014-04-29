# Model for the Message Table
class Message < ActiveRecord::Base
  has_one :sent_message, dependent: :destroy
  has_one :received_message, dependent: :destroy

  validates :title, presence: true

  def mark_as_read
    received_message.read = true
    received_message.save
  end
end
