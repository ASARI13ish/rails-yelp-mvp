require 'faker'

# Clear existing records
Restaurant.destroy_all
Review.destroy_all
puts 'Reset database'

# Define categories
categories = %w[chinese italian japanese french belgian]
puts 'Creating restaurants'

# Create restaurants
restaurants = 5.times.map do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
  puts "Created the restaurant #{restaurant.name}"
  restaurant
end

# Create reviews for some restaurants
puts 'Creating reviews'

restaurants.each do |restaurant|
  rand(1..5).times do
    Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
    puts "Created a review for #{restaurant.name}"
  end
end

puts "Seeded #{Restaurant.count} restaurants with #{Review.count} reviews."
