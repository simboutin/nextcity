# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Answer.destroy_all
CityComment.destroy_all
City.destroy_all
User.destroy_all
Bookmark.destroy_all

puts "Instance de la city"

@city = City.create!(
  name: "Angers",
  latitude: "47.4711",
  longitude: "-0.547307",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
  population: "123445"
  )

puts "Instance des users"

@user = User.create!(first_name: 'Cloé', last_name: 'Courage', address: "SS", email: "user@exemple.com", password: "user@exemple.com")
@user.photo.attach(io: File.open("app/assets/images/cloe.png"), filename: "logo.png", content_type: "image/png")
@user.photo.key

puts "Création de Cloé terminée"

@ambassador = User.create!(first_name: 'amba', last_name: 'ssador', address: "SS", email: "ambassador@exemple.com", password: "ambassador@exemple.com", city: @city)
@ambassador.photo.attach(io: File.open("app/assets/images/ambassador.png"), filename: "logo.png", content_type: "image/png")
@ambassador.photo.key

puts "Création de l'ambassador terminé"

puts "Instance des questions"

@question_one = CityComment.create!(
  content: "Trouve t'on des nougats dans cette ville ?",
  city: @city,
  user: @user
  )

@question_two = CityComment.create!(
  content: "Vous aimez les tatanes ?",
  city: @city,
  user: @user
  )

puts "Instance des réponses"

answer_one = Answer.create!(
  comment: "On trouve de tout dans cette ville, même l'amour HAHAHA ;)",
  city_comment: @question_one,
  user: @ambassador
  )
