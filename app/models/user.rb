class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :conversations

  after_create do
    self.profile = Profile.create!
  end

  def messages
    num_msg = 0
    conversations.each do |conversation|
      num_msg += conversation.messages.count
    end
    num_msg
  end
end
