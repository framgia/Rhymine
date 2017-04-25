Rails.application.routes.draw do
  root "pages#show", page: "welcome"
  get "/pages/:page" => "pages#show"
end
