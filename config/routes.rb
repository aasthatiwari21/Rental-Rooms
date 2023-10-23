Rails.application.routes.draw do
  get 'booking/new'
  get 'booking/create'
  get 'booking/success'
  resources :orders
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root 'homes#index'
  # Defines the root path route ("/")
 get '/search',to: 'properties#search'

  resources :properties do 
    member do
      get "contact_owner"
  end
 end
 resources :bookings, only: %i[new create success]

 resources :properties do 
    member do
      get "booking"
  end
 end
  resources :properties do
    resources :reviews ,except: [:show,:index]
  end

  resources :payments

  devise_scope :user do
    get '/sign_out', to: 'users/sessions#destroy'
  end

    # post 'payments/create' 
    get 'payment/success' , to: 'payments#success'
    get 'payments/cancel'

    get '/dashboard', to: 'dashboard#index'
 resources :properties do
   get "/pay", to: "payments#new", as: :pay

end

end