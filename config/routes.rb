Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :likes, only: [:create] do
      end
      resources :comments, only: [:create, :destroy] do
      end
    end
  end
  post '/auth/login', to: 'auth#login'
  root "users#index"
end
