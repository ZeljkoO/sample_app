class AddProductionQuantityToDemandAndProductReturns < ActiveRecord::Migration
  def change
    add_column :demand_and_product_returns, :production_quantity, :float
  end
end
