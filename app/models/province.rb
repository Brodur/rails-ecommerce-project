class Province < ApplicationRecord
  has_many :addresses
  has_many :customers, through: :addresses
end
