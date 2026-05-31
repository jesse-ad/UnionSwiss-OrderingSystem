Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get "admin", to: "pages#admin"
  get "dashboard", to: "pages#distributor", as: :distributor_dashboard

  resources :products
  resources :distributors
  resources :skus

  # order items belong to orders
  resources :orders do 
    resources :order_items
  end

  resources :orders do

  member do
    patch :submit
  end

  resources :order_items do
    member do
      patch :increment
      patch :decrement
    end
  end

end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
