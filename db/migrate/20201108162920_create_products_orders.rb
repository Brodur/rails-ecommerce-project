class CreateProductsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :products_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :historic_price, null: false
      t.decimal :historic_cost, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
