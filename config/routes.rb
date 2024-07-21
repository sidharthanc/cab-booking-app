Rails.application.routes.draw do
  resources :customer_requests, only: [:new, :create, :show]
  
  resources :rides, only: [:show, :update] do
    patch 'update_ride', on: :member
  end

  root 'customer_requests#new'
end
