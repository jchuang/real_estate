class AddOwnerIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :owner_id, :integer
    add_index :buildings, :owner_id
  end
end
