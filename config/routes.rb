Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "static_page#index"
  resources :posts
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

end
