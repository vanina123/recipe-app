class UsersController < ApplicationController
  def shopping_list
    @user = current_user
    @recipes = @user.recipes.includes(recipe_foods: :food)

    @missing_foods = RecipeFood.includes(:food).where(recipe: @recipes).to_a

    @total_food_items = @missing_foods.sum(&:quantity)
    @total_price = @missing_foods.sum { |recipe_food| recipe_food.quantity * recipe_food.food.price }
  end
end
