class ProductsOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :historic_cost, :historic_price, :quantity, numericality: true
  validates :historic_cost, :historic_price, presence: true
end
