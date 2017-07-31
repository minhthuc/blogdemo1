Rails.application.routes.draw do
  get "tags/create"
  get :search, controller: :main
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "static_page#index"
  resources :posts do
    resources :comments
  end
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

end
