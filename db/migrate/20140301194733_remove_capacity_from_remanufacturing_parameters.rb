class RemoveCapacityFromRemanufacturingParameters < ActiveRecord::Migration
  def up
    remove_column :remanufacturing_parameters, :capacity
  end

  def down
    add_column :remanufacturing_parameters, :capacity, :float
  end
end
