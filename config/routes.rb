Rails.application.routes.draw do
  resources :bike_routes

  root to: 'bike_routes#index'
end
