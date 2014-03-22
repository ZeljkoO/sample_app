class RemoveRemanufacturingCapacityFromDemandAndProductReturns < ActiveRecord::Migration
  def up
    remove_column :demand_and_product_returns, :remanufacturing_capacity
  end

  def down
    add_column :demand_and_product_returns, :remanufacturing_capacity, :float
  end
end
