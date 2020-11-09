class RenameCountryColumnOnAddressesToCountryCode < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :country, :country_code
  end
end
