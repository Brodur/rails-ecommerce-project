class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :province
  has_many :orders
end
