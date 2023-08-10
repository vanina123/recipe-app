require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create!(name: 'paul', email: 'paul@gmail.com', password: 'Password')
    @recipe = Recipe.create!(name: 'Beans', preparation_time: 20, cooking_time: 2,
                             description: 'A delicious recipe for beans', user: @user)
    @food = Food.create!(name: 'Beans', measurement_unit: 'Kg', price: 300, quantity: 2, user: @user)
    @recipe_food = RecipeFood.create!(recipe: @recipe, food: @food, quantity: 2)
  end

  it 'can be created' do
    expect(@recipe_food).to be_valid
  end

  it 'requires a recipe' do
    @recipe_food.recipe = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'requires a food' do
    @recipe_food.food = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'requires a quantity' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'requires a non-negative quantity' do
    @recipe_food.quantity = -1
    expect(@recipe_food).to_not be_valid
  end
end
