class RemanufacturingParameter < ActiveRecord::Base
  attr_accessible :holding_cost, :initial_inventory, :product_id, :remanufacturing_cost, :remanufacturing_time, :setup_cost, :setup_time
  validates :remanufacturing_cost, :numericality => { :greater_than_or_equal_to => 0}
  validates :remanufacturing_time, :numericality => { :greater_than_or_equal_to => 0}
  validates :setup_cost, :numericality => { :greater_than_or_equal_to => 0}
  validates :setup_time, :numericality => { :greater_than_or_equal_to => 0}
  validates :holding_cost, :numericality => { :greater_than_or_equal_to => 0}
  validates :initial_inventory, :numericality => { :greater_than_or_equal_to => 0}

  belongs_to :product

  def remanufacturing_parameter_name
    self.product.name
  end
end
