Rails.application.routes.draw do
  devise_for :users
  
  root to: 'recipes#index'
  resources :recipes do
    collection do
      get 'search'
    end
  end

  resources :charts
  resources :users, only: :show
  resources :messages, only: [:new, :create]
end
