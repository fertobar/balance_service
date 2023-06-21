Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users

  resources :categories do
    collection do
      get 'search'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
end
