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
admin_profile = Profile.new(first_name: 'admin', last_name: 'admin', gender: 'M', country_code: 'ZA', state_code: 'GT')
User.create!(email: 'admin@loveletters.com', password: 'password', username: 'administrator', is_administrator: true, profile: admin_profile)
# Create Test Users
test1_profile = Profile.new(first_name: 'test', last_name: '1', gender: 'M', country_code: 'ZA', state_code: 'GT')
User.create!(email: 'test1@loveletters.com', password: 'password', username: 'test1', is_administrator: false, profile: test1_profile)
test2_profile = Profile.new(first_name: 'test', last_name: '2', gender: 'M', country_code: 'ZA', state_code: 'GT')
User.create!(email: 'test2@loveletters.com', password: 'password', username: 'test2', is_administrator: false, profile: test2_profile)
test3_profile = Profile.new(first_name: 'test', last_name: '3', gender: 'M', country_code: 'ZA', state_code: 'GT')
User.create!(email: 'test3@loveletters.com', password: 'password', username: 'test3', is_administrator: false, profile: test3_profile)
test4_profile = Profile.new(first_name: 'test', last_name: '4', gender: 'M', country_code: 'ZA', state_code: 'GT')
User.create!(email: 'test4@loveletters.com', password: 'password', username: 'test4', is_administrator: false, profile: test4_profile)