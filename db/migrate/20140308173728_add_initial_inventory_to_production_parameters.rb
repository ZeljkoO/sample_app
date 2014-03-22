class AddInitialInventoryToProductionParameters < ActiveRecord::Migration
  def change
    add_column :production_parameters, :initial_inventory, :float
  end
end
