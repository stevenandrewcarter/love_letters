class Message < ActiveRecord::Base
  has_one :sent_message, dependent: :destroy
  has_one :received_message, dependent: :destroy

  validates :title, presence: true
end
