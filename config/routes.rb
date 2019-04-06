Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/service'
  get 'pages/contact'
 resources :owners
 resources :users
 resources :walkers
 resources :services
 resources :dogs
 resources :appointments
 resources :invoices
end
