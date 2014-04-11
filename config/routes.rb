Rails.application.routes.draw do
  devise_for :users
  root to: "application#index"
  
  namespace :api do
    resources :links do
      post 'discover', on: :collection
    end
  end
end
