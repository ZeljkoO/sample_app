class CreateRemanufacturingParameters < ActiveRecord::Migration
  def change
    create_table :remanufacturing_parameters do |t|
      t.integer :product_id
      t.float :remanufacturing_cost
      t.float :setup_cost
      t.float :setup_time
      t.float :holding_cost
      t.float :capacity

      t.timestamps
    end
  end
end
