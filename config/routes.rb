Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/contact'



 

  
  resources :owners
  resources :users
  resources :walkers
  resources :services
  resources :dogs
  resources :appointments
  resources :invoices
  resources :sessions, only: [:new, :create, :destroy]
end
