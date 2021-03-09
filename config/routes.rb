Rails.application.routes.draw do
  devise_for :users
  
  root to: 'recipes#index'
  resources :recipes
  resources :charts, only:[:index]
end
