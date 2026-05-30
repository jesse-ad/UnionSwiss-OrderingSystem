Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get "admin", to: "pages#admin"
  #get "distributor", to: "pages#distributor"

  resources :products
  resources :distributors
  resources :skus

  # order items belong to orders
  resources :orders do 
    resources :order_items
  end

  # For incrementing and decrementing products
  resources :orders do
  resources :order_items do
    member do
      patch :increment
      patch :decrement
    end
  end

  resources :orders do
  member do
    patch :submit
    end
  end
  
end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
