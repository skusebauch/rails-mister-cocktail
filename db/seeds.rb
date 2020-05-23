# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Starting process!...."
puts "Cleare Database"

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts "using json list to input ingredients from thecocktaildb.com-API"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
ingredtients = JSON.parse(ingredient_serialized)

ingredtients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "Create three default cocktails"

url1 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590254625/blue-margarita-with-lemon-2480828_hnta22.jpg')
url2 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590254555/alcoholic-bar-beverage-blur-338713_tr4ljk.jpg')
url3 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590254707/a-drink-in-a-glass-with-green-leaf-2691360_cpcr6v.jpg')

german_killer = Cocktail.new(name: "German Killer")
one_shot = Cocktail.new(name: "Just one")
driver_friendly = Cocktail.new(name: "Driver friendly")

german_killer.photo.attach(io: url1, filename: "german_killer.jpg", content_type: "image/jpg")
one_shot.photo.attach(io: url2, filename: "one_shot.jpg", content_type: "image/jpg")
driver_friendly.photo.attach(io: url3, filename: "driver_friendly.png", content_type: "image/png")

german_killer.save
one_shot.save
driver_friendly.save

puts "Completed!"
