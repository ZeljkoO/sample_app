class AddCapacityToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :capacity, :float
  end
end
