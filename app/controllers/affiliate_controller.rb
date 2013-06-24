class AffiliateController < ApplicationController
	def table
	@affiliate = Affiliate.find(params[:affiliate])
	end
end
