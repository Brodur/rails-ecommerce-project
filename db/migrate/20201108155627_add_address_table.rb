class AddAddressTable < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :provinces, null: false
      t.references :customers, null: false

      t.boolean :is_primary_address, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.string :address_line_one, null: false
      t.string :address_line_two, null: true
      t.string :address_additional, null: true

      t.timestamps
    end
  end
end
