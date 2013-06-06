class Client < ActiveRecord::Base
set_primary_key :id
set_table_name "Clients"
belongs_to :company
belongs_to :lead


attr_accessible :first_name, :last_name, :email_address, :phone, :highest_level_of_education, :enroll , :lead_id, :company_id
# accepts_nested_attributes_for :lead

validates :first_name, presence: true
validates :last_name, presence: true
validates :email_address, presence: true
validates :phone, presence: true
validates :highest_level_of_education, presence: true
validates :enroll, presence: true
# validates :lead_id, presence: true
# validates :company_id, presence: true

# def initialize(attributes = {})
#     @first_name  = attributes[:first_name]
#     @last_name  = attributes[:last_name]
#     @email_address  = attributes[:email_address]
#     @phone  = attributes[:phone]
#     @highest_level_of_education = attributes[:highest_level_of_education]
#     @enroll  = attributes[:enroll]
#   end
def enroll_a
	enroll.split(" ").map { |s| s.to_i }
end
# def new_lead(lead, company)
# 	joins(lead)
# 	joins(company)
# end
end