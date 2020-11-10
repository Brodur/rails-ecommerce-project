class ChangeTaxesDefaultToZeroOnProvinces < ActiveRecord::Migration[6.0]
  def change
    change_column_default :provinces, :gst_rate, to: 0.00
    change_column_default :provinces, :pst_rate, to: 0.00
    change_column_default :provinces, :hst_rate, to: 0.00
  end
end
