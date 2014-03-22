class AddRemanufacturingCapacityToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :remanufacturing_capacity, :float
  end
end
