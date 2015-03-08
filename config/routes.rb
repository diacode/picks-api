Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  
  root to: "application#index"
  
  namespace :api, defaults: { format: :json } do
    resources :links
    resources :compilations
  end
end
