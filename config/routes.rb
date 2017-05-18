Rails.application.routes.draw do
  devise_for :users

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :users, only: [:index, :show] do
    resources :relationships, only: :index
  end
  resources :songs, except: [:edit, :update, :destroy]
  resources :comments, except: [:index, :new, :show]
  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  namespace :admins do
    resources :genres, only: [:index, :create]
    resources :users, only: [:index, :destroy]
  end
end
