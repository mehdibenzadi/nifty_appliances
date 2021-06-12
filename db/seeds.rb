# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Appliance.destroy_all
SerialNumber.destroy_all
User.destroy_all

puts 'Creating users...'
user1 = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => false
user2 = User.create! :email => 'marylin@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => false
user3 = User.create! :email => 'joey@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => true
user4 = User.create! :email => 'lucy@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :repairer => true

puts 'Creating appliances...'
appliance = Appliance.create! :model => 'BOSCH Série 8', :serial_number => 'SMV8YCX01E', :user_id => user1.id, :family => 1
appliance = Appliance.create! :model => 'INDESIT Lave-Linge Hublot', :serial_number => 'BWE71483WFRN', :user_id => user1.id, :family => 2
appliance = Appliance.create! :model => 'BEKO Réfrigérateur', :serial_number => 'LLF07W15', :user_id => user1.id, :family => '3'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user1.id, :family => '1'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user2.id, :family => '2'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user2.id, :family => '3'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user3.id, :family => '1'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user3.id, :family => '2'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user3.id, :family => '2 '
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user4.id, :family => '3'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user4.id, :family => '2'
appliance = Appliance.create! :model => 'AAZZCC', :serial_number => '1236589', :user_id => user4.id, :family => '3'

puts 'Creating serial numbers...'
SerialNumber.create!({ value: "SMV8YCX01E" })
SerialNumber.create!({ value: "BWE71483WFRN" })
SerialNumber.create!({ value: "LLF07W15" })
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
