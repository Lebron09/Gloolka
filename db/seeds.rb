# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

manager_ids = []
10.times do
  manager = Manager.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    passport_id: Faker::IDNumber.valid,
    address: Faker::Address.street_address,
    city: Faker::Address.city
  )
  manager_ids << manager.id
end

10.times do
  Developer.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    passport_id: Faker::IDNumber.valid,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    manager_id: manager_ids.sample
  )
end