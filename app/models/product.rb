class Product < ApplicationRecord
  has_many :orders, through: :products_orders
end
