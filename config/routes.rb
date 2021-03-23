Rails.application.routes.draw do
  devise_for :users
  
  root to: 'recipes#index'
  resources :recipes do
    collection do
      get 'search'
    end
  end
  resources :charts, only:[:index, :new, :create]
  resources :users, only: :show
end
