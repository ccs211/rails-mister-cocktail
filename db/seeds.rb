# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
NAMES = ["tornado", "cosmo", "cosmo1", "cosmo2"]
Cocktail.destroy_all
Ingredient.destroy_all

result = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
drinks = result['drinks']

drinks.each do |drink|
  drink.each do |a, b|
    Ingredient.create(name: b)
  end
end


10.times do
  main_cocktail = Cocktail.create(name: NAMES.sample)
  # main_cocktail.ingredients << Ingredient.all.sample
  # main_cocktail.ingredients << Ingredient.all.sample
  Dose.create(description: "Great", cocktail_id: main_cocktail.id, ingredient_id: Ingredient.all.sample.id )
  Dose.create(description: "Great", cocktail_id: main_cocktail.id, ingredient_id: Ingredient.all.sample.id )
end

