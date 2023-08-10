require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create!(name: 'paul', email: 'paul@gmail.com', password: 'Password')
  end

  it 'can be created' do
    recipe = Recipe.create!(name: 'Beans', preparation_time: 20, cooking_time: 2, description: 'A delicious recipe for beans', user: @user)
    expect(recipe).to be_valid
  end

  it 'requires a name' do
    recipe = Recipe.new(name: nil)
    recipe.validate
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it 'requires a name with at least 2 characters' do
    recipe = Recipe.new(name: 'A')
    recipe.validate
    expect(recipe.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it 'requires a name with at most 50 characters' do
    recipe = Recipe.new(name: 'a' * 51)
    recipe.validate
    expect(recipe.errors[:name]).to include("is too long (maximum is 50 characters)")
  end

  it 'requires a preparation_time' do
    recipe = Recipe.new(preparation_time: nil)
    recipe.validate
    expect(recipe.errors[:preparation_time]).to include("can't be blank")
  end

  it 'requires a preparation_time that is an integer' do
    recipe = Recipe.new(preparation_time: 'abc')
    recipe.validate
    expect(recipe.errors[:preparation_time]).to include("is not a number")
  end

  it 'requires a preparation_time that is greater than 0' do
    recipe = Recipe.new(preparation_time: -1)
    recipe.validate
    expect(recipe.errors[:preparation_time]).to include("must be greater than 0")
  end

  it 'requires a cooking_time' do
    recipe = Recipe.new(cooking_time: nil)
    recipe.validate
    expect(recipe.errors[:cooking_time]).to include("can't be blank")
  end

  it 'requires a cooking_time that is an integer' do
    recipe = Recipe.new(cooking_time: 'abc')
    recipe.validate
    expect(recipe.errors[:cooking_time]).to include("is not a number")
  end

  it 'requires a cooking_time that is greater than 0' do
    recipe = Recipe.new(cooking_time: -1)
    recipe.validate
    expect(recipe.errors[:cooking_time]).to include("must be greater than 0")
  end

  it 'requires a description' do
    recipe = Recipe.new(description: nil)
    recipe.validate
    expect(recipe.errors[:description]).to include("can't be blank")
  end
end