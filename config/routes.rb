Rails.application.routes.draw do
  root 'pages#home'
  get 'login' =>  'sessions#new'
  post 'login' =>  'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'pages/contact'
  get 'pages/login'

 

 
 resources :owners
 resources :users
 resources :walkers
 resources :appointments
 resources :services, only: [:index, :show]
 resources :dogs, controller: "dogs" do
  resources :appointments
  resources :invoices, only: [:index, :show, :update]
 end
  resources :invoices
 
end
