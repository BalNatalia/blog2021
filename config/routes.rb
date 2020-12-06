Rails.application.routes.draw do
<<<<<<< HEAD
  resources :likes
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout
  root 'posts#index'
=======
  get 'sessions/new', as: :login
  resources :users
  resources :articles
  get 'say/hello'
  get 'say/goodbye'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'say#hello'
  post 'sessions/create', as: :create_session
  get 'sessions/destroy', as: :destroy_session
>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
end
