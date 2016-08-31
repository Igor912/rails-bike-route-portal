Rails.application.routes.draw do

  get 'bike_lanes_map/index'

  devise_for :users

  resources :bike_routes do
    resources :comments
    collection do
      get :index_all_not_approved
    end
    get :approve, :on => :member
    get :disapprove, :on => :member
  end

  resources :feedbacks

  root to: 'bike_routes#index'
end
