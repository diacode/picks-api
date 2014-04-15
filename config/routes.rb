Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  root to: "application#index"
  
  namespace :api do
    resources :links
  end
end
