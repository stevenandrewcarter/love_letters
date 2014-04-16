class UserHasFavourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favourite_user, class_name: 'User', foreign_key: 'user_favourite_id'
end
