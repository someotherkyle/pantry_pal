Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :edit, :destroy]
  resources :pantries, only: [:new, :create, :show, :edit, :destroy]
  resources :ingredients, only: [:new, :create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#home'
end
