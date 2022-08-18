Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :likes, only: [:create] do
      end
      resources :comments, only: [:create] do
      end
    end
  end
  root "users#index"
end
