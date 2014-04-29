# Model for the User Table
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :sent_messages, class_name: 'SentMessage', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'ReceivedMessage', foreign_key: 'recipient_id'
  has_many :favourites, class_name: 'UserHasFavourite'
  validates :username, presence: true, uniqueness: true

  def unread_messages
    received_messages.where(read: false)
  end

  def total_messages
    received_messages.count
  end

  def favourite?(user)
    !favourites.where(user_favourite_id: user.id).first.nil?
  end

  def administrator?
    is_administrator
  end

  def self.matches(user_id)
    User.all
  end

  after_create do
    self.is_administrator = false
  end
end
