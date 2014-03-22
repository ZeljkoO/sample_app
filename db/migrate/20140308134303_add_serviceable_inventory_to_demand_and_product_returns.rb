class AddServiceableInventoryToDemandAndProductReturns < ActiveRecord::Migration
  def change
    add_column :demand_and_product_returns, :serviceable_inventory, :float
  end
end
