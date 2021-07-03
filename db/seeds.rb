# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."

Article.destroy_all

puts "Database cleaned"

puts "_________________"

puts "Creating new articles..."

10.times do
  Article.create!(
    title: Faker::Drone.name,
    body: Faker::Lorem.sentence(word_count: 20),
    source_link: Faker::Internet.url(host: 'example.com'),
  )
end

puts "Posts created"
