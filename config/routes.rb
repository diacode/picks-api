Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :links do
      post 'discover', on: :collection
    end
  end
end
