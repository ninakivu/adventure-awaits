Rails.application.routes.draw do

  root 'trips#index'
  resources :users
  resources :trips do
    resources :comments 
  end

  
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout
end
