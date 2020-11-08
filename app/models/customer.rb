class Customer < ApplicationRecord
  has_many :addresses
  has_many :orders
  has_many :provinces, through: :address
end
