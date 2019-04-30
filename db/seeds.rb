# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# puts 'starting seed data'

# User.create(username:"rob", password_digest: "1234", email:"robby
#   @robby.com", phone_number: "1234567890", user_type: "customer")

# Item.create(name: "banana", price: 0.99, sold_by: "/LB", category: "produce", description: "monkey's fav", image_url: "https://images.unsplash.com/photo-1528825871115-3581a5387919?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80")
#
# Item.create(name: "fuji apple", price: 1.99, sold_by: "/LB", category: "produce", description: "grown in NY state, support your local orchards", image_url: "https://images.unsplash.com/photo-1506813713591-56fc5e539b80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1348&q=80")
#
# Item.create(name: "white peach", price: 0.99, sold_by: "/LB", category: "produce", description: "Grown in NJ. Perfect for a pie or wash and enjoy as nature intended", image_url: "https://images.unsplash.com/photo-1532704868953-d85f24176d73?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")
#
# UserItem.create(user_id: 1, item_id: 1)
#
# Store.create(name: "Trader Robby's", image_url: "https://www.expertsure.com/uk/merchant-accounts/wp-content/uploads/2018/03/merchant-icon-300x300.png")
#
# StoreItem.create(store_id: 1, item_id: 2)



#
# puts 'finished seeding'
require 'csv'

CSV.read(Rails.root.join('lib', 'seeds', 'seeds2.csv'), headers: true).each do |row|
  t = Item.new
  t.name = row['name']
  t.price = row['price'].to_f
  t.sold_by = row['sold_by']
  t.category = row['category']
  t.description = row['description']
  t.image_url = row['image_url']
  t.save
  puts "#{t.name}, #{t.category} saved"
  end


puts "There are now #{Item.count} rows in the transactions table"
