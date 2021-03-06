Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/microposts', to: 'microposts#edit'

  resources :users
  resources :microposts, only: [:create, :edit, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
