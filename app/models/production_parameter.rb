class ProductionParameter < ActiveRecord::Base
  attr_accessible :holding_cost, :initial_inventory, :product_id, :production_cost, :production_time, :setup_cost, :setup_time
  validates :production_cost, :numericality => { :greater_than_or_equal_to => 0}
  validates :production_time, :numericality => { :greater_than_or_equal_to => 0}
  validates :setup_cost, :numericality => { :greater_than_or_equal_to => 0}
  validates :setup_time, :numericality => { :greater_than_or_equal_to => 0}
  validates :holding_cost, :numericality => { :greater_than_or_equal_to => 0}
  validates :initial_inventory, :numericality => { :greater_than_or_equal_to => 0}

  belongs_to :product

  def production_parameter_name
    self.product.name
  end

end
