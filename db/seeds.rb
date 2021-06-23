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
appliance = Appliance.create! :model => 'BOSCH Série 8 Lave-Vaisselle', :serial_number => 'SMV8YCX01E', :user_id => user1.id, :family => 1
appliance = Appliance.create! :model => 'INDESIT Lave-Linge Hublot', :serial_number => 'BWE71483WFRN', :user_id => user1.id, :family => 2
appliance = Appliance.create! :model => 'BEKO Réfrigérateur', :serial_number => 'LLF07W15', :user_id => user1.id, :family => '3'
appliance = Appliance.create! :model => 'ARTHUR MARTIN Lave-Vaisselle', :serial_number => 'AMEFR345768', :user_id => user1.id, :family => '1'
appliance = Appliance.create! :model => 'WHIRLPOOL Lave-Linge Top', :serial_number => 'TDLR623FR/N', :user_id => user2.id, :family => '2'
appliance = Appliance.create! :model => 'LG Réfrigérateur Américain', :serial_number => 'GSL6681PS', :user_id => user2.id, :family => '3'
appliance = Appliance.create! :model => 'LG DF Lave-Vaisselle', :serial_number => 'DF425HSSS', :user_id => user3.id, :family => '1'
appliance = Appliance.create! :model => 'ELECTROLUX Lave-Linge Hublot', :serial_number => 'EW7F3816DB', :user_id => user3.id, :family => '2'
appliance = Appliance.create! :model => 'HISENSE Lave-Linge Hublot', :serial_number => 'WFQR1014EVAJM', :user_id => user3.id, :family => '2 '
appliance = Appliance.create! :model => 'HISENSE Réfrigérateur Combiné', :serial_number => 'RB400N4ACD', :user_id => user4.id, :family => '3'
appliance = Appliance.create! :model => 'ESSENTIELB Lave-Linge Séchant', :serial_number => 'ELS712-2B', :user_id => user4.id, :family => '2'
appliance = Appliance.create! :model => 'HAIER Réfrigérateur Multi Portes', :serial_number => 'HTF-610DM7', :user_id => user4.id, :family => '3'

puts 'Creating serial numbers...'
SerialNumber.create!({ value: "SMV8YCX01E" })
SerialNumber.create!({ value: "BWE71483WFRN" })
SerialNumber.create!({ value: "LLF07W15" })
SerialNumber.create!({ value: "LW1075628" })
SerialNumber.create!({ value: "AMEFR345768" })
SerialNumber.create!({ value: "TDLR623FR/N" })
SerialNumber.create!({ value: "GSL6681PS" })
SerialNumber.create!({ value: "DF425HSSS" })
SerialNumber.create!({ value: "EW7F3816DB" })
SerialNumber.create!({ value: "WFQR1014EVAJM" })
SerialNumber.create!({ value: "RB400N4ACD" })
SerialNumber.create!({ value: "ELS712-2B" })
SerialNumber.create!({ value: "HTF-610DM7" })

puts 'Creating Events...'
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be a Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be a White 240T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the White 240T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'danger', value: 'There\'s an issue on your machine. It show an error Code F12', occurs_at: Time.current, serial_number: 'SMV8YCX01E')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be a Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be a White 240T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the White 240T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'danger', value: 'There\'s an issue on your machine. It show an error Code F12', occurs_at: Time.current, serial_number: 'BWE71483WFRN')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'primary', value: 'Your machine has just started a new cycle. It seems to be a Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be a White 240T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the White 240T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'danger', value: 'There\'s an issue on your machine. It show an error Code F12', occurs_at: Time.current, serial_number: 'LLF07W15')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'primary', value: 'Your machine has just started a new cycle. It seems to be a Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Black 380T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be a White 240T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'success', value: 'Your machine has just ended it\'s cycle. It refers to the White 240T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'primary', value: 'Your machine started a new cycle. It seems to be an Eco 250T/min cycle.', occurs_at: Time.current, serial_number: 'AMEFR345768')
Event.create!(event_type: 'danger', value: 'There\'s an issue on your machine. It show an error Code F12', occurs_at: Time.current, serial_number: 'AMEFR345768')