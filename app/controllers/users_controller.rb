class UsersController < ApplicationController
  
  def shopping_list
    @user = current_user
    @recipes = @user.recipes.includes(recipe_foods: [:food])

    @missing_foods = []
    @recipes.each do |recipe|
      @missing_foods += recipe.missing_foods
    end

    @total_food_items = @missing_foods.sum(&:quantity)
    @total_price = @missing_foods.sum { |recipe_food| recipe_food.quantity * recipe_food.food.price }
  end
end
