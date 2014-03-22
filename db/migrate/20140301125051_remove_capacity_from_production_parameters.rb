class RemoveCapacityFromProductionParameters < ActiveRecord::Migration
  def up
    remove_column :production_parameters, :capacity
  end

  def down
    add_column :production_parameters, :capacity, :float
  end
end
