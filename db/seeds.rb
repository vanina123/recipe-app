# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create!(name: 'John Doe', email: 'john@example.com', password: 'password')
# User.create!(name: 'Jane Smith', email: 'jane@example.com', password: 'password')

# Create Recipes
Recipe.create!(name: 'Vanilla Cake', preparation_time: Time.now, cooking_time: 20,
               description: 'Delicious vaninlla cake recipe.', public: true, user_id: 1)
Recipe.create!(name: 'Vegetable Stir-Fry', preparation_time: Time.now, cooking_time: 30,
               description: 'Healthy vegetable stir-fry recipe.', public: true, user_id: 2)
