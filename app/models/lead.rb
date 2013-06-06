class Lead < ActiveRecord::Base
	set_primary_key :id
	set_table_name "Leads"
	belongs_to :company
	has_many :clients



	attr_accessible :name, :phone, :address, :total, :success, :company_id
	# ,:company_id
	# accepts_nested_attributes_for :company

validates :name, presence: true
validates :phone, presence: true
validates :address, presence: true
validates :total, presence: true
validates :success, presence: true
# validates :company_id, presence: true

# def initialize(attributes = {})
#     @name  = attributes[:name]
#     @phone  = attributes[:phone]
#     @address  = attributes[:address]
#     @total  = attributes[:total]
#     @success = attributes[:success]
#   end

# def new_company (company)
# 	joins(company)
# end

# def delete_company! (company)
# 	Lead.
 end