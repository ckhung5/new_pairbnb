# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
require 'faker'
 
100.times do
  user = User.new
  user.email = Faker::Internet.email
  user.name = Faker::Name.name
  user.password = "1234"
  if user.save
    number_of_listing = rand(0..3)
    number_of_listing.times do
      listing = Listing.new
      # listing.title = Faker::Lorem.sentence(3, true, 18)
      # listing.bedroom = Faker::Number.number(1)
      #listing.check_in = Faker::Date.between(2.days.ago, Date.today)
      #listing.check_out = Faker::
      listing.address = Faker::Address.country
      listing.description = Faker::Hipster.paragraph(2, true, 8)
      # listing.rules = Faker::Hipster.paragraph(2, true, 8)
      listing.price = Faker::Number.between(40, 1300)
      # listing.availability_requirement = Faker::Hipster.paragraph(1, true, 2)
      # listing.main_image = Faker::Avatar.image
      user.listings << listing
      user.save
    end
  end
end

#admin
  user1 = User.new
  user1.email = "ckhung5@gmail.com"
  user1.name = "kh"
  user1.password = "1234"
  user1.status = 2
  user1.save
