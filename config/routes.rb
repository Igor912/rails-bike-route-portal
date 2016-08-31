Rails.application.routes.draw do

  get 'bike_lanes_map/index'

  devise_for :users

  resources :bike_routes do
    resources :comments
  end

  resources :feedbacks

  root to: 'bike_routes#index'
end
