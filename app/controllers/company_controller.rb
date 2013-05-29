class CompanyController < ApplicationController

  def table
  		@company = Company
  		@product = Product.find(1)


  		# @name = company.product.name
  		# @name = {Company.find(1) => lead.name}
  end

  def graph
  	  		@company = Company
  		@product = Product.find(1)
  end
end
