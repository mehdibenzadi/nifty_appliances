# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating users...'
user = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => false
user = User.create! :email => 'marylin@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => false
user = User.create! :email => 'joey@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => true
user = User.create! :email => 'lucy@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => true

puts 'Creating appliances...'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '1', :family => 1
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '1', :family => 2
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '1', :family => '3'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '1', :family => '1'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '2', :family => '2'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '2', :family => '3'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '3', :family => '1'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '3', :family => '2'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '3', :family => '2 '
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '4', :family => '3'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '4', :family => '2'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => '4', :family => '3'

puts 'Creating serial numbers...'
SerialNumber.create!({ value: "1236589" })
SerialNumber.create!({ value: "1590607" })
SerialNumber.create!({ value: "4789304" })
SerialNumber.create!({ value: "1075628" })
SerialNumber.create!({ value: "9068376" })
SerialNumber.create!({ value: "9876543" })
SerialNumber.create!({ value: "2846928" })
SerialNumber.create!({ value: "1234567" })
SerialNumber.create!({ value: "7654321" })
SerialNumber.create!({ value: "1324354" })
SerialNumber.create!({ value: "7564243" })
SerialNumber.create!({ value: "0798645" })
SerialNumber.create!({ value: "0687922" })