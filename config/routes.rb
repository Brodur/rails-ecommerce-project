Rails.application.routes.draw do
  resources :products, only: %i[index show]
  resources :categories, only: %i[index show]

  post "carts/add_to_cart/:id", to: "carts#add_to_cart", as: "add_to_cart"
  delete "carts/remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from_cart"
  patch "carts/update_cart_quantity/:id", to: "carts#update_cart_quantity", as: "update_cart_quantity"

  root to: "products#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
