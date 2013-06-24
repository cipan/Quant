class LeadController < ApplicationController

  def graph

      # @company = Company.find(params[:company])
      @data_table = GoogleVisualr::DataTable.new
      @data_table.new_column('number', 'Month' )
      
      @data_table.add_rows(48) 
      48.times do |t|
        @data_table.set_cell( t , 0, t)
      end

      5.times do |t|
        @data_table.new_column('number', "Phycho-demographic #{t+1}")
        lead_total = Array.new(48, 0)
        students = Student.find_all_by_psycho_demographic(t+1)
        students.each do |student|
          lead_total = [student.enroll_a, lead_total].transpose.map {|x|(x.reduce(:+).to_f)}
        end
        lead_total.map!{|item| item /students.length.to_f}

        lead_total.length.times do |row|
          @data_table.set_cell( row , t+1 , lead_total[row])
        end 

      end
      

      opts = { width: 1000, height: 500, title: 'Enrollment by Phycho-demographic', hAxis: {title: 'Month', titleTextStyle: {color: '#FF0000'}} }
      @chart = GoogleVisualr::Interactive::AreaChart.new(@data_table, opts)
  end
  
  def page
    number_pages = Student.all.first.page_a.length
    @data_table = GoogleVisualr::DataTable.new
    @data_table.new_column('number', 'Page Number')
    @data_table.new_column('number', 'Version A')
    @data_table.new_column('number', 'Version B')

    @data_table.add_rows(number_pages)
    number_pages.times do |n|
      @data_table.set_cell(n, 0, n+1)
    end  
    versions = []
    versions << Student.find_all_by_page_ver('B')
    versions << Student.find_all_by_page_ver('A')

    versions.length.times do |version_num|
      version = versions[version_num]
      pages_total = Array.new(number_pages, 0) 
      version.each do |student|
        pages_total = [student.page_a, pages_total].transpose.map {|x|(x.reduce(:+).to_f)}
      end
      pages_total.map!{|item| item /version.length.to_f}
      if version_num == 0
       @n = pages_total
      end
      if version_num == 1
        @p = pages_total
      end
      pages_total.length.times do |t|
        @data_table.set_cell(t,  version_num+1, pages_total[t])
      end
    end

    opts = { width: 1000, height: 500, title: 'Total Page Completion', hAxis: {title: 'Page Number', titleTextStyle: {color: '#FF0000'}} }
    @chart = GoogleVisualr::Interactive::ColumnChart.new(@data_table, opts)
  end
end
