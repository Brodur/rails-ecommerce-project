class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :products_orders
  has_many :products, through: :products_orders

  validates :historic_gst_rate, :historic_pst_rate, :historic_hst_rate, numericality: true

  def subtotal
    sum = 0
    products_orders.each do |product_order|
      sum += product_order.subtotal
    end
    sum
  end

  def tax_rates
    tax = []
    if address.province.pst_rate.present? && address.province.pst_rate > 0
      tax << { rate: address.province.pst_rate, label: "PST" }
    end
    if address.province.gst_rate.present? && address.province.gst_rate > 0
      tax << { rate: address.province.gst_rate, label: "GST" }
    end
    if address.province.hst_rate.present? && address.province.hst_rate > 0
      tax << { rate: address.province.hst_rate, label: "HST" }
    end
    tax
  end

  def grand_total
    sum = subtotal
    tax_rates.each do |t|
      sum += subtotal * t[:rate]
    end
    sum
  end
end
