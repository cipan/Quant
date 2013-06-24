class LeadSale < ActiveRecord::Base
	belongs_to :student
	belongs_to :affiliate

	attr_accessible :price, :student_id, :affiliate_id

	validates :price, presence: true

end
