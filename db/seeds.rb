# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

loren = Teacher.create!(full_name: "Loren", email: "loren@theuniversity.com")
loren_user = User.create!(email: "loren@theuniversity.com", password: "password")
loren_user.personable = loren
loren_user.save!
