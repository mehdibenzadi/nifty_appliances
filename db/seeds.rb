# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating serial numbers...'
SerialNumber.create!({
  value: "1236589"
})
SerialNumber.create!({
  value: "1590607"
})
SerialNumber.create!({
  value: "4789304"
})
SerialNumber.create!({
  value: "1075628"
})
SerialNumber.create!({
   value: "9068376"
})
