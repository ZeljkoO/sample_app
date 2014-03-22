class AddProductFamilyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_family, :string
  end
end
