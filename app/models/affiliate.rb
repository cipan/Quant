class Affiliate < ActiveRecord::Base
	has_many :lead_sales
	attr_accessible :name, :phone, :address, :city, :state, :zip

	validates :name, presence: true
	validates :phone, presence: true
 	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	
	def purchase (price, student)
		LeadSale.create(price: price, student_id: student.id, affiliate_id: self.id)
	end
end
