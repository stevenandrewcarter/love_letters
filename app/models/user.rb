class User < ActiveRecord::Base
  validates :user_name, presence: true, length: { minimum: 6 }
end
