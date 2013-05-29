class Product < ActiveRecord::Base
	# add_foreign_key :id
	belongs_to :company

	attr_accessible :name, :description, :price, :category

end