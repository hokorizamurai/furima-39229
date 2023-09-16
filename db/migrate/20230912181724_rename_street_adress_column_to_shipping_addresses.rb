class RenameStreetAdressColumnToShippingAddresses < ActiveRecord::Migration[6.0]
  def change
      rename_column :shipping_addresses, :street_adress, :street_address
  end
end
