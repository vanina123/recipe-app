Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: %i[show edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipees, only: %i[index show new create destroy] do
    member do
      patch :toggle_public
    end
    resources :recipe_foods, only: %i[new create destroy] 
  end
end