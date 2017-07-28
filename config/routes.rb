Rails.application.routes.draw do
  devise_for :users
  root "static_page#index"
  resources :posts
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

end
