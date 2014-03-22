class AddRemanufacturingQuantityToDemandAndProductReturns < ActiveRecord::Migration
  def change
    add_column :demand_and_product_returns, :remanufacturing_quantity, :float
  end
end
