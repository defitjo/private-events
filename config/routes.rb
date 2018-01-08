Rails.application.routes.draw do
  get    'help',    to: 'static_pages#help'
  get    'about',   to: 'static_pages#about'
  get    '/signup', to: 'users#new'
  get    'login',   to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'

  resources :users
  resources :events
  resources :event_attendees,     only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end