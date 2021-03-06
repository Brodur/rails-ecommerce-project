class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.datetime :order_date
      t.decimal :historic_pst_rate
      t.decimal :historic_gst_rate
      t.decimal :historic_hst_rate

      t.timestamps
    end
  end
end
