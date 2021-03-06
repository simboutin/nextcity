# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user = User.create!(first_name: 'TO', last_name: 'Jo', address: "SS", email: "fsfs@ca.com", password: "123456")
user.photo.attach(io: File.open("app/assets/images/logo.png"), filename: "logo.png", content_type: "image/png")

p user.photo.key

Cloudinary::Api.resource(user.photo.key)


