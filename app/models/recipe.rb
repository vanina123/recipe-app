class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def foods_counter
    self.recipe_foods.count
  end

  def foods_total_price
    total_price = 0

    self.recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price
    end

    return total_price
  end
  
  def missing_foods
    recipe_foods.select { |recipe_food| recipe_food.quantity > 0 && recipe_food.food.quantity < recipe_food.quantity }
  end
end
