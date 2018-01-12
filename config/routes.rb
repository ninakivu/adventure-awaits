Rails.application.routes.draw do

  root 'trips#index'
  resources :users
  resources :invites 
  resources :trips do 
    resources :images
    resources :comments
    get "invite", to: "invites#new" #-> app/trips/:trip_id/invite
    post "invite", to: "invites#create" #-> app/trips/:trip_id/invite
 end  
  
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout
end
