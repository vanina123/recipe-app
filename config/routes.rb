Rails.application.routes.draw do
  devise_for :users
  root 'recipes#public_list'
  
    resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create destroy] do
    member do
      patch :toggle_public
    end
    resources :recipe_foods, only: %i[new create destroy] 
  end
  get 'shopping_list', to: 'users#shopping_list'
  get 'public_recipes', to: 'recipes#public_list', as: 'public_recipes'
end