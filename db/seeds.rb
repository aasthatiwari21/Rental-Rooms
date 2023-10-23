# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Role.find_or_create_by!(name:'Owner')
Role.find_or_create_by!(name:'Seeker')
Role.find_or_create_by!(name:'Broker')


PropertyType.find_or_create_by!(name:'House')
PropertyType.find_or_create_by!(name:'Row_House')
PropertyType.find_or_create_by!(name:'Shop')
PropertyType.find_or_create_by!(name:'Office')
PropertyType.find_or_create_by!(name:'Flat')

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?