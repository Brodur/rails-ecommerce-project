class RenameAssociationsOnAdresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :provinces_id, :province_id
    rename_column :addresses, :customers_id, :customer_id
  end
end
