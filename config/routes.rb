Rails.application.routes.draw do
  root 'pages#home'
  get 'login' =>  'sessions#new'
  post 'login' =>  'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'pages/contact'
  get 'pages/login'

 

 
 resources :owners, controller: "owners" do 
  resources :invoices, only: [:index]
 end
 resources :users
 resources :walkers, controller: "walkers" do 
  resources :appointments, only: [:index]
  resources :dogs, only: [:index]
 end
  
 resources :appointments
 resources :services, only: [:index, :show]
 resources :dogs, controller: "dogs" do
  resources :appointments
 end
  resources :invoices
 
end
