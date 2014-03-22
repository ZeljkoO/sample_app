class CreateDemandAndProductReturns < ActiveRecord::Migration
  def change
    create_table :demand_and_product_returns do |t|
      t.integer :period_id
      t.integer :product_id
      t.float :demand
      t.float :return

      t.timestamps
    end
  end
end
