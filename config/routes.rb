Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipees, only: %i[index show new create destroy] do
    member do
      patch :toggle_public
    end
    resources :recipe_foods, only: %i[new create destroy] 
  end