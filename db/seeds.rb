# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
100.times do
  Library.create(name: Faker::Book.title, location: Faker::Address.street_address)
end

100.times do
  Book.create(title: Faker::Book.title, description: Faker::Lorem.paragraph, library_id: rand(1..100))
end

100.times do
  Author.create(name: Faker::Book.author)
end

100.times do
  Genre.create(name: Faker::Book.genre)
end

# Сгенерировать 100 записей для модели ReaderCard
100.times do
  ReaderCard.create(card_number: Faker::Number.number(digits: 8), user_id: rand(1..100), library_id: rand(1..100))
end

# Сгенерировать 100 записей для модели User
100.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end