require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before :each do
    @user = create(:user)
    sign_in @user

    @recipe1 = create(:recipe, user: @user)
    @recipe2 = create(:recipe, public: true, user: @user)
  end

  describe 'GET /recipes' do
    it 'returns a success response' do
      get recipes_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get recipes_path
      expect(response).to render_template(:index)
    end

    it 'assigns @recipes' do
      get recipes_path
      expect(assigns(:recipes)).to eq([@recipe1])
    end
  end

  describe 'GET /recipes/:id' do
    it 'returns a success response' do
      get recipe_path(@recipe1)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get recipe_path(@recipe1)
      expect(response).to render_template(:show)
    end

    it 'assigns @recipe' do
      get recipe_path(@recipe1)
      expect(assigns(:recipe)).to eq(@recipe1)
    end
  end

  describe 'GET /recipes/public' do
    it 'returns a success response' do
      get public_recipes_path
      expect(response).to have_http_status(200)
    end

    it 'renders the public recipes template' do
      get public_recipes_path
      expect(response).to render_template(:public_recipes)
    end

    it 'assigns @public_recipes' do
      get public_recipes_path
      expect(assigns(:public_recipes)).to eq([@recipe2])
    end
  end

  describe 'GET /recipes/shopping_list' do
    it 'returns a success response' do
      get shopping_list_recipes_path
      expect(response).to have_http_status(200)
    end

    it 'renders the shopping list template' do
      get shopping_list_recipes_path
      expect(response).to render_template(:shopping_list)
    end

    it 'assigns @missing_foods' do
      get shopping_list_recipes_path
      expect(assigns(:missing_foods).count).to eq(2)
    end

    it 'assigns @total_food_items' do
      get shopping_list_recipes_path
      expect(assigns(:total_food_items)).to eq(3)
    end

    it 'assigns @total_price' do
      get shopping_list_recipes_path
      expect(assigns(:total_price)).to eq(25)
    end
  end
end
