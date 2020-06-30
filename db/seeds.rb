# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def populate_reviews(restaurant)
  rand(0..5).times do
    review = Review.new(
      content: Faker::TvShows::SiliconValley.quote,
      rating: rand(0..5)
    )
    review.restaurant = restaurant
    review.save
  end
end

puts 'Clearing database...'
Restaurant.destroy_all
puts 'Database cleared!'

puts 'Creating 10 seeds...'

10.times do
  restaurant = Restaurant.new(
    name: Faker::TvShows::SiliconValley.company,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )
  restaurant.save
  populate_reviews(restaurant)
end

puts 'Seeds created!'
