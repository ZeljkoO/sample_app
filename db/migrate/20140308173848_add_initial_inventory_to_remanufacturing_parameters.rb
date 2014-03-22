class AddInitialInventoryToRemanufacturingParameters < ActiveRecord::Migration
  def change
    add_column :remanufacturing_parameters, :initial_inventory, :float
  end
end
