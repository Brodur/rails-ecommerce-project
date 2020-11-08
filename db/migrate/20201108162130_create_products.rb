class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :upc, null: false
      t.decimal :price, null: false
      t.decimal :cost, null: false
      t.text :description
      t.integer :on_hand, null: false, default: 0

      t.timestamps
    end
  end
end
