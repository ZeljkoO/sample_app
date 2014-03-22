class AddRecoverableInventoryToDemandAndProductReturns < ActiveRecord::Migration
  def change
    add_column :demand_and_product_returns, :recoverable_inventory, :float
  end
end
