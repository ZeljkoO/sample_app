class AddRemanufacturingTimeToRemanufacturingParameters < ActiveRecord::Migration
  def change
    add_column :remanufacturing_parameters, :remanufacturing_time, :float
  end
end
