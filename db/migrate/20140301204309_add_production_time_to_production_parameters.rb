class AddProductionTimeToProductionParameters < ActiveRecord::Migration
  def change
    add_column :production_parameters, :production_time, :float
  end
end
