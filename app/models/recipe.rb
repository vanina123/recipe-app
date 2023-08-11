class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy, class_name: 'RecipeFood'
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  def foods_counter
    recipe_foods.count
  end

  def foods_total_price
    total_price = 0

    recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price
    end

    total_price
  end

  def missing_foods
    recipe_foods.select do |recipe_food|
      recipe_food.quantity.positive? && recipe_food.food.quantity < recipe_food.quantity
    end
  end
end
