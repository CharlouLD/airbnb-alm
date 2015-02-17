# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

owner1 = User.new({
  name: 'Arthur',
  email: 'arthur@email.com',
  password: '12345678',
})

owner1.save

customer = User.new({
  name: 'Lilian',
  email: 'lilian@email.com',
  password: '12345678',
})
customer.save

product1 = Product.new({
  title: 'appart1',
  owner: owner1,
  city: "Paris",
  description: 'blabla1',
  night_price: 30
})
product1.save

product2 = Product.new({
  title: 'appart1',
  owner: owner1,
  city: "Lille",
  description: 'blabla2',
  night_price: 45
})
product2.save

product3 = Product.new({
  title: 'appart3',
  owner: owner1,
  city: "Caen",
  description: 'blabla3',
  night_price: 50
})
product3.save

booking = Booking.new({
  customer: customer,
  product: product1,
  check_in: Time.now,
  night: 3
})

booking.save