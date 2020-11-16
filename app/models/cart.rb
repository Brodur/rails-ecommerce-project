class Cart < ApplicationRecord
  belongs_to :product

  validates :session_id, :product, :quantity, presence: true
end
