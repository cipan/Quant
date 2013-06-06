class Company < ActiveRecord::Base
	set_primary_key :id
	set_table_name "Companies"
	# has_one :product
	attr_accessible :name, :product_name	
	has_many :clients, :through => :leads
	has_many :leads


	# accepts_nested_attributes_for :leads, :clients
	validates :name, presence: true
	validates :product_name, presence: true



  
  # def initialize(attributes = {})
  #   @name  = attributes[:name]
  #   @product_name = attributes[:product_name]
  # end

end