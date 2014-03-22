class AddRemanufacturingCapacityToDemandAndProductReturns < ActiveRecord::Migration
  def change
    add_column :demand_and_product_returns, :remanufacturing_capacity, :float
  end
end
