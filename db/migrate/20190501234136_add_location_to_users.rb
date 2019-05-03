class AddLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :store_items, :location, :string
  end
end
