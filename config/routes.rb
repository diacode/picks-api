Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  
  root to: "application#index"
  
  namespace :api, defaults: { format: :json } do
    resources :links do
      get :approved, on: :collection
      get :unapproved, on: :collection
    end
    resources :compilations
  end
end
