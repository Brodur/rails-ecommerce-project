class Order < ApplicationRecord
  belongs_to :customers
  belongs_to :address
end
