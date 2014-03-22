class Period < ActiveRecord::Base
  attr_accessible :number, :capacity, :remanufacturing_capacity
  validates :number, :numericality => { :greater_than_or_equal_to => 0}, :uniqueness => { case_sensitive: true }

  validates :capacity, :numericality => { :greater_than_or_equal_to => 0}
  validates :remanufacturing_capacity, :numericality => { :greater_than_or_equal_to => 0}

  has_many :demand_and_product_returns, :dependent => :destroy
end
