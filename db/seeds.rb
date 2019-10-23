# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding new flats"
10.times do
  puts "Here goes one"
  flat = Flat.new(
   name: Faker::Address.community,
   address: Faker::Address.full_address,
   description: Faker::Quotes::Shakespeare.hamlet_quote,
   price_per_night: (1..20).to_a.sample * 10,
   number_of_guests: (1..8).to_a.sample )
  puts flat.name
  flat.save!
end
