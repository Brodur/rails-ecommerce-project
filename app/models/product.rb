class Product < ApplicationRecord
  belongs_to :category
  has_many :products_orders
  has_many :orders, through: :products_orders

  validates :upc, :name, :price, :cost, presence: true
  validates :upc, numericality: true, length: { is: 12 }
  validates :price, :cost, numericality: true
  validates :upc, uniqueness: true

  has_one_attached :image

  paginates_per 10
end
