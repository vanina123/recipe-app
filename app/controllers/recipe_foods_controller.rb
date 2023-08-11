class RecipeFoodsController < ApplicationController
    before_action :set_recipe, only: %i[create new]
  
    def new
      @recipe_food = RecipeFood.new
    end
  
    def create
      @recipe_food = RecipeFood.new(recipe_food_params)
      @recipe_food.recipe = @recipe
      if @recipe_food.save
        redirect_to user_recipe_path(id: @recipe.id, user_id: @recipe.user.id), notice: 'Food item added to the recipe.'
      else
        render :new
      end
    end
    def destroy
        @recipe_food = RecipeFood.find_by(food_id: params[:id], recipe_id: params[:recipe_id])
        p @recipe_food
        # @recipe_food = RecipeFood.find(params[:recipe_food_id])
        # @recipe_food.destroy
        if @recipe_food.destroy
            redirect_to(request.referrer || root_path)
          else
            flash[:error] = 'error'
          end
        
        # redirect_to user_recipe_path(id: @recipe_food.recipe_id, user_id: current_user.id), notice: 'Food item was successfully deleted.'
    end
  
  
    private
  
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def recipe_food_params
      params.require(:recipe_food).permit(:quantity, :food_id)
    end
  end