Rails.application.routes.draw do

  devise_for :users

  resources :bike_routes do
    resources :comments
  end

  resources :feedbacks

  root to: 'bike_routes#index'
end
