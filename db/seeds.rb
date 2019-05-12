# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# The order in which you seed matters! Make sure a creation of an instance doesnt have an attribute that is dependent on another seed!
# also because of Bcrypt it is better to create users from the actual app rather than seed it or else password wont be encrypted

puts "starting manual seed data"
Store.create(name: "H&Y Marketplace")



require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seedData.CSV'))
csv = CSV.parse(csv_text.scrub, headers: true)
csv.each do |row|

  t = Item.new
  t.name = row['name']
  t.price = row['price']
  t.sold_by = row['sold_by']
  t.category = row['category']
  t.description = row['description']
  t.image_url = row['image_url']
  t.save
  puts "#{t.name}, #{t.category} saved"
  end


puts "There are now #{Item.count} rows in the transactions table"



i = 1
38.times do
  aisle = [*1..10].sample
  puts "#{aisle}"
  puts " i is: #{i}"
  store = StoreItem.create(store_id: 1, item_id: "#{i}".to_i ,location: "aisle-#{aisle}")
  puts "last created storeitem is: #{StoreItem.all.last}"
  i+=1
  puts "made #{store}"
  puts "i is: #{i}"

end

puts "finished manual seed data"
