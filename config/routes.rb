Rails.application.routes.draw do
  devise_for :users
  resources :foods, only: %i[index new create destroy]
  post 'recipes/:id/toggle', to: 'recipes#toggle', as: :toggle_recipe 
  get 'general_shopping_list', to: 'users#shopping_list'
  delete '/destroy_recipe/:recipe_id/foods/:id', to: 'recipe_foods#destroy'
  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :update, :edit]
    end
  end
  root "recipes#public"
end