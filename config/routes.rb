Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root 'homes#index'
  # Defines the root path route ("/")
 get '/search',to: 'properties#search'

  resources :properties do 
    member do
      get "contact_owner"
      get "brokered"
  end
 end

 resources :properties do 
    member do
      get "booking"
  end
 end
 
 resources :properties

  resources :properties do
    resources :reviews ,except: [:show,:index]
  end

  resources :payments

  devise_scope :user do
    get '/sign_out', to: 'users/sessions#destroy'
  end

    get 'payment/payment_history' , to: 'payments#payment_history'
    get 'payment/success' , to: 'payments#success'
    get 'payments/cancel' , to: 'payments#cancel'

    get '/dashboard', to: 'dashboard#index'

  namespace :api do 
    resources :reviews
    resources :users 
    post '/auth/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
    resources :properties
  end
   

end