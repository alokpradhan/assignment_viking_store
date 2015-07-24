# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.destroy_all
Address.destroy_all
BillingInfo.destroy_all

# Creating 25 users who each have two addresses and two credit cards
25.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  2.times do
	  address = Address.create(street: Faker::Address.street_address,
													  	city: Faker::Address.city,
													  	state: Faker::Address.state,
													  	zipcode: Faker::Address.zip_code)
	  credit_card = BillingInfo.create(user_id: user.id,
																	  	phone_number:Faker::PhoneNumber.phone_number,
																	  	cc_type: Faker::Business.credit_card_type,
																	  	cc_number: Faker::Business.credit_card_number,
																	  	cc_expiry: Faker::Business.credit_card_expiry_date,
																	  	address_id: address.id)
	end
end

# Creating 30 user address joins so each user will have multiple addresses
30.times do
	unique_user_id = User.select(:id)
	seed_user_id = unique_user_id[rand(0...User.select(:id).length)][:id]
	unique_address_id = Address.select(:id)
	seed_address_id = unique_address_id[rand(0...Address.select(:id).length)][:id]
	useraddress = UserAddressJoin.create(user_id: seed_user_id, address_id: seed_address_id)
end

# Create 5 categories
  unique_categories = Faker::Commerce.department(6,true).split(", ")
  unique_categories.each do |category_description|
  	category = Category.create(description: category_description)
  end

# Create 50 products
50.times do
	unique_category_id = Category.select(:id)
	seed_category_id = unique_category_id[rand(0...Category.select(:id).length)][:id]
	product = Product.create(title: Faker::Commerce.product_name,
		description: Faker::Lorem.paragraph,
		price: Faker::Commerce.price,
		sku: rand(0..5000),
		category_id: seed_category_id)
end