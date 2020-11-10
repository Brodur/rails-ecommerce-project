class Province < ApplicationRecord
  has_many :addresses
  has_many :customers, through: :addresses
  validates :name, :code, presence: true, uniqueness: true
  validates :code, length: { is: 2 }
  validates :hst_rate, :gst_rate, :pst_rate, numericality: true
end
