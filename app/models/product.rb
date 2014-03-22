class Product < ActiveRecord::Base
  attr_accessible :name, :product_family
  validates :name, presence: true, :uniqueness => { case_sensitive: true }
  validates :product_family, presence: true

  has_many :production_parameters, :dependent => :destroy
  has_many :remanufacturing_parameters, :dependent => :destroy
  has_many :demand_and_product_returns, :dependent => :destroy
end
