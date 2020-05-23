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

classic_url1 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590256180/alcohol-beverage-blur-brown-616836_wr304o.jpg')
healthy_url2 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590256141/alcohol-alcoholic-bar-beverage-4784_m6soja.jpg')
driver_url3 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590256127/carrot-fruit-beside-lemon-fruit-on-black-wooden-table-161440_sonfjf.jpg')
coconut_url4 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590256128/clear-drinking-glass-filled-with-beverage-2103945_kglqjs.jpg')
fruit_url5 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590256220/blur-breakfast-close-up-cocktail-209594_npdaz2.jpg')
martini_url6 = URI.open('https://res.cloudinary.com/dgwgea5k3/image/upload/v1590256320/martini-glass-on-table-3073970_ydq2sj.jpg')

el_classico = Cocktail.new(name: "El Classico")
healthy_hangover = Cocktail.new(name: "Healthy Hangover")
driver_friendly = Cocktail.new(name: "Driver Friendly")
coconut_bomb = Cocktail.new(name: "Coconut Bomb")
fruit_passion = Cocktail.new(name: "Fruit Passion")
martini = Cocktail.new(name: "Martini")

el_classico.photo.attach(io: classic_url1, filename: "el_classico.jpg", content_type: "image/jpg")
healthy_hangover.photo.attach(io: healthy_url2, filename: "healthy_hangover.jpg", content_type: "image/jpg")
driver_friendly.photo.attach(io: driver_url3, filename: "driver_friendly.png", content_type: "image/jpg")
coconut_bomb.photo.attach(io: coconut_url4, filename: "coconut_bomb.png", content_type: "image/jpg")
fruit_passion.photo.attach(io: fruit_url5, filename: "fruit_passion.png", content_type: "image/jpg")
martini.photo.attach(io: martini_url6, filename: "martini.png", content_type: "image/jpg")

el_classico.save
healthy_hangover.save
driver_friendly.save
coconut_bomb.save
fruit_passion.save
martini.save

puts "Completed!"
