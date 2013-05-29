class Lead < ActiveRecord::Base
	# add_foreign_key :id
	belongs_to :company

	attr_accessible :name, :phone, :address, :total, :success

end