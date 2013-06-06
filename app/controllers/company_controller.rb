class CompanyController < ApplicationController

  def table
  		# @company = Company
  		# @product = Product.find(1)


  		# @name = company.product.name
  		# @name = {Company.find(1) => lead.name}
  end

  def graph
      @company = Company.first
      @data_table = GoogleVisualr::DataTable.new
      @data_table.new_column('number', 'Month' )
      @company.leads.each do |lead|
        @data_table.new_column('number', lead.name)
      end
      
      @data_table.add_rows(48) 
      48.times do |t|
        @data_table.set_cell( t , 0, t)
        @t = t
      end
      n = 1
   
      @company.leads.each do |lead|
          lead_total = Array.new(48, 0)
           clients = Client.find_all_by_lead_id(lead.id)
          clients.each do |client|
            lead_total = [client.enroll_a, lead_total].transpose.map {|x|(x.reduce(:+).to_f)}
          end
          lead_total.map!{|item| item /clients.length.to_f}

        lead_total.length.times do |row|
          @data_table.set_cell( row , n , lead_total[row])
        end 
        n += 1
      end

      opts = { width: 1000, height: 500, title: 'Enrollment by Lead', hAxis: {title: 'Month', titleTextStyle: {color: '#FF0000'}} }
      @chart = GoogleVisualr::Interactive::AreaChart.new(@data_table, opts)
  end
end
