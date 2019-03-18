Rails.application.routes.draw do
  get 'sessions/new'
  get 'pages/index'
  root 'pages#index'
  get 'pages/help'
  resources :comments
  resources :users
  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

end
