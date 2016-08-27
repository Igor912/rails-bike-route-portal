Rails.application.routes.draw do
  devise_for :users
  resources :bike_routes

  root to: 'bike_routes#index'
end
