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

Cocktail.create(name: "German Killer")
Cocktail.create(name: "Just one")
Cocktail.create(name: "Driver friendly")

puts "Completed!"
