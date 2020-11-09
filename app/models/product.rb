class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :products_orders
end
