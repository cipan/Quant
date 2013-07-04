class AffiliateController < ApplicationController
	def table
		# Commenting contained in view. All coding done within view in HTML. 
		# Creates the columns for the lead display table for an affiliate's purchased leads
		# Itterates of the leads for the affiliate passed in setting the tables values.
		
		@affiliate = Affiliate.find(params[:affiliate])
	end
end
