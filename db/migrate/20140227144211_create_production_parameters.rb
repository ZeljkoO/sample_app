class CreateProductionParameters < ActiveRecord::Migration
  def change
    create_table :production_parameters do |t|
      t.integer :product_id
      t.float :production_cost
      t.float :setup_cost
      t.float :setup_time
      t.float :holding_cost
      t.float :capacity

      t.timestamps
    end
  end
end
