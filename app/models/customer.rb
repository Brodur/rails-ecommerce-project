class Customer < ApplicationRecord
  has_many :addresses
  has_many :orders
  has_many :provinces, through: :addresses
  validates :name, :username, :email, :password, presence: true
  validates :password, length: { minimum: 10 }
  validates :email, uniqueness: true
end
