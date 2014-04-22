class PopulateDefaultUser < ActiveRecord::Migration
  def up
    User.create!(email: 'admin@loveletters.com', password: 'password', username: 'administrator', is_administrator: true)
  end
end