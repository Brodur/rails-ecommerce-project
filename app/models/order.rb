class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :products_orders
  has_many :products, through: :products_orders

  validates :historic_gst_rate, :historic_pst_rate, :historic_hst_rate, numericality: true
end
