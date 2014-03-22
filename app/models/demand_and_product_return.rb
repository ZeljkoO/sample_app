class DemandAndProductReturn < ActiveRecord::Base
  attr_accessible :demand, :period_id, :product_id, :production_quantity, :recoverable_inventory, :remanufacturing_quantity, :return, :serviceable_inventory
  validates :demand, :numericality => { :greater_than_or_equal_to => 0}
  validates :return, :numericality => { :greater_than_or_equal_to => 0}

  belongs_to :product
  belongs_to :period
end
