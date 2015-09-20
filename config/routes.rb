Rails.application.routes.draw do
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :edit, :update]
  match '/signin',  to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete
  root "articles#index"
end
