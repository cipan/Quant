class Lead < ActiveRecord::Base
	set_primary_key :id
	set_table_name "Leads"
	has_one :student

attr_accessible  :first_name, :last_name, :phone, :address, :city, :state, :zip, :opt_in

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :opt_in, presence: true


end