# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Clear existing Users
User.delete_all
# Create the default admin user
User.create!(email: 'admin@loveletters.com', password: 'password', username: 'administrator', is_administrator: true,
             profile: Profile.new(first_name: 'admin', last_name: 'admin', gender: 'M', country_code: 'ZA', state_code: 'GT'))
# Create Test Users
User.create!(email: 'test1@loveletters.com', password: 'password', username: 'test1', is_administrator: false)
User.create!(email: 'test2@loveletters.com', password: 'password', username: 'test2', is_administrator: false)
User.create!(email: 'test3@loveletters.com', password: 'password', username: 'test3', is_administrator: false)
User.create!(email: 'test4@loveletters.com', password: 'password', username: 'test4', is_administrator: false)