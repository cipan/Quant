class Student < ActiveRecord::Base
	set_primary_key :id
	set_table_name "Students"

	has_many :lead_sales
	belongs_to :lead
	attr_accessible :age_range, :sex, :nationality, :psycho_demographic, :employed, :student, :education_level, :education_aos, :income_level, :enrollment, :page_pass, :page_ver

	validates :age_range, presence: true
	validates :sex, presence: true
	validates :nationality, presence: true
	validates :psycho_demographic, presence: true
	validates :employed, presence: true
	validates :student, presence: true
	validates :education_level, presence: true
	validates :education_aos, presence: true
	validates :income_level, presence: true
	validates :enrollment, presence: true
	validates :page_pass, presence: true
	validates :page_ver, presence: true

	def enroll_a
		enrollment.split(" ").map { |s| s.to_i }
	end

	def page_a
		page_pass.split(" ").map { |s| s.to_i }
	end
 end