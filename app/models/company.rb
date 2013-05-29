class Company < ActiveRecord::Base
	# set_primary_key :id
	has_one :product
	has_many :lead
	accepts_nested_attributes_for :product, :lead
	attr_accessible :name, :product, :lead

end