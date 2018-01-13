Rails.application.routes.draw do

  root 'trips#index'
  resources :users
  resources :invites, except: [:new, :create]
  patch "/invites/:id/accept" => "invites#accept", as: :accept_invite
  patch "/invites/:id/reject" => "invites#reject", as: :reject_invite
  resources :trips do
    resources :invites, only: [:new, :create]
    resources :images
    resources :comments
    get "invite", to: "invites#new" #-> app/trips/:trip_id/invite
    post "invite", to: "invites#create" #-> app/trips/:trip_id/invite
 end  
  
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout
end
