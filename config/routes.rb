Rails.application.routes.draw do
  get 'trips/index'

  get 'trips/show'

  get 'trips/new'

  get 'trips/create'

  get 'trips/edit'

  get 'trips/update'

  get 'trips/destroy'

  root 'users#index'
  resources :users
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout
end
