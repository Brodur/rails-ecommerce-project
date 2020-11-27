Rails.application.routes.draw do
  resources :products, only: %i[index show]
  resources :categories, only: %i[index show]
  resources :front_page, only: %i[index]

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  patch "products/update_cart_quantity/:id", to: "products#update_cart_quantity", as: "update_cart_quantity"

  root to: "front_page#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :customers, controllers: {
    sessions:      "customers/sessions",
    registrations: "customers/registrations"
  }

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
