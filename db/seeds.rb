# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'leo', password: 'l', password_confirmation: 'l', role: 'admin', email: 'l@l')
# User.create(name: 'fly', password: 'f', password_confirmation: 'f', role: 'normal', email: 'f@f')