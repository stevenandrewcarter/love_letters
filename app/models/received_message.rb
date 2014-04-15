class ReceivedMessage < ActiveRecord::Base
  belongs_to :message
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'

  validates :sender_id, presence: true
  validates :recipient_id, presence: true
end
