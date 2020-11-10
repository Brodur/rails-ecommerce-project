class ChangeHistoricTaxesDefaultToZeroOnOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_default :orders, :historic_gst_rate, to: 0.00
    change_column_default :orders, :historic_pst_rate, to: 0.00
    change_column_default :orders, :historic_hst_rate, to: 0.00
  end
end
