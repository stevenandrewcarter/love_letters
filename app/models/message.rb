class Message < ActiveRecord::Base
  belongs_to :sent_message
  belongs_to :received_message

  validates :title, presence: true
end
