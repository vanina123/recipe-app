class ChangeIntegerInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :cooking_time, :text
    change_column :recipes, :preparation_time, :text
  end
end
