Rails.application.routes.draw do
  namespace :admin do
    # root route for admin
    root "application#index"
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # non-admin routes
  root "posts#index"
  resources :posts, only: [:index, :show] do
    resources :comments
  end

  # admin routes
  namespace :admin do
    resources :posts, except: [:index, :show] do
      resources :comments
    end
  end
end
