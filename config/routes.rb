Rails.application.routes.draw do
  devise_for :users
  
  root to: 'recipes#index'
  resources :recipes do
    collection do
      get 'search'
    end
    resources :messages, only: :create
    resources :favorites, only: [:create, :destroy]
  end

  resources :charts
  resources :users, only: :show do
    get :favorites, on: :collection
  end
end
