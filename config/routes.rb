Rails.application.routes.draw do
  devise_for :users

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end
