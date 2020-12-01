class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :province
  has_many :orders
  validates :postal_code, :country_code, :city, :address_line_one, presence: true
  validates :postal_code, length: { maximum: 7 }
  validates :country_code, length: { is: 2 }
  validates_with AddressValidator, attributes: [:is_primary_address]
end
