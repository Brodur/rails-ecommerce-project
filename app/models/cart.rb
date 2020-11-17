class Cart < ApplicationRecord
  belongs_to :product

  validates :session_id, :product, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
end
