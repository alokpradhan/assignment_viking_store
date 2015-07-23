# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.destroy_all
Address.destroy_all
BillingInfo.destroy_all

# Creating 25 users who each have two addresses and two credit cards
25.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  address = Address.create(street: Faker::Address.street_address ,city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
  credit_card = BillingInfo.create(user_id: user.id, phone_number:Faker::PhoneNumber.phone_number, cc_type: Faker::Business.credit_card_type, cc_number: Faker::Business.credit_card_number, cc_expiry: Faker::Business.credit_card_expiry_date, address_id: address.id )
end
