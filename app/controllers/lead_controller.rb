class LeadController < ApplicationController

  # Graph for the over time enrollment of students based on a dynamic selection of demographic options. Used for both affiliates and sellers.
  def graph
      @data_table = GoogleVisualr::DataTable.new
      @data_table.new_column('number', 'Month' )

      # Sets the x axis to the values 1-48
      @data_table.add_rows(48) 
      48.times do |t|
        @data_table.set_cell( t , 0, t)
      end

      # Graph method used for both affiliate and lead (seller), if :affiliate is present then creates array of students for a give affiliate
      aff_students = []
      if params[:affiliate] != nil
        lead_sales = LeadSale.where(:affiliate_id => params[:affiliate]).all
        lead_sales.each do |sale|
          aff_students << sale.student
        end
      end 

      # TODO: Consider meta array holding arrays for each of a demographic's values, with sorting then transpose and addition based on value. 
      # TODO: Set this to accept more than just Psycho-demographic.
      # Method sorts through and for each of the FIVE demographics, averages enrollment and sets the datatable. 
      5.times do |t|
        # Table setup and initiliziation of the arregate enrollment array for the demographic
        @data_table.new_column('number', "Psycho-demographic #{t+1}")
        lead_total = Array.new(48, 0)

        # If used for a lead (affiliate is empty), uses all of the leads from students table with a give demographic value. 
        if params[:affiliate] == nil
          students = Student.find_all_by_psycho_demographic(t+1)
        else 
        # If used for an affiliate, creates an array of students that belong to the demographic currently being set
          students = []
          aff_students.each do |student|
            if student.psycho_demographic == t+1
              students << student
            end
          end
        end

        # Transposes and adds each of the corresponding values of each of the students with a given demographic value. 
        students.each do |student|
          lead_total = [student.enroll_a, lead_total].transpose.map {|x|(x.reduce(:+).to_f)}
        end
        lead_total.map!{|item| item /students.length.to_f}

        # Sets the cell based on the demographic itteration number (t) to the value corresponding to the row (1-48)
        lead_total.length.times do |row|
          @data_table.set_cell( row , t+1 , lead_total[row])
        end 
      end
      

      opts = { width: 1000, height: 500, title: 'Enrollment by Phycho-demographic', hAxis: {title: 'Month', titleTextStyle: {color: '#FF0000'}} }
      @chart = GoogleVisualr::Interactive::AreaChart.new(@data_table, opts)
  end
  
  # TODO: This chart is off by one column, review. 
  # Controller function for the effectiveness of a given seller's individual pages.  
  def page
    # Data table set-up. Assumes using standard A/B testing, but set to expand. Assumes all versions have same page numbers, gains page number variable from the first student from a seller's list. 
    number_pages = Student.all.first.page_a.length
    @data_table = GoogleVisualr::DataTable.new
    @data_table.new_column('number', 'Page Number')
    @data_table.new_column('number', 'Version A')
    @data_table.new_column('number', 'Version B')

    # Table set-up for x axis. Sets axis to 1-number_pages
    @data_table.add_rows(number_pages)
    number_pages.times do |n|
      @data_table.set_cell(n, 0, n+1)
    end 

    # Array containing two arrays, one for each version, A & B. This allows for non standard more version testing to occur later on. Simply add another column and add another array to the versions[].
    versions = []
    versions << Student.find_all_by_page_ver('B')
    versions << Student.find_all_by_page_ver('A')

    # Sets the data table, one version at a time. 
    versions.length.times do |version_num|     
      version = versions[version_num]

      # Creates array that will act as the summation of completion to be the average for each version then transposes and adds.
      pages_total = Array.new(number_pages, 0) 
      version.each do |student|
        pages_total = [student.page_a, pages_total].transpose.map {|x|(x.reduce(:+).to_f)}
      end
      # Divides by the number of leads that completed the given verion to gain an average (because 1 = completed & 0 = uncompleted)
      pages_total.map!{|item| item /version.length.to_f}
      # Sets the cells so t is the page number, and pages_total[t] is the average completion. The column is the one greater than the iteration because column 0 is x axis. 
      pages_total.length.times do |t|
        @data_table.set_cell(t,  version_num+1, pages_total[t])
      end
    end

    opts = { width: 1000, height: 500, title: 'Total Page Completion', hAxis: {title: 'Page Number', titleTextStyle: {color: '#FF0000'}} }
    @chart = GoogleVisualr::Interactive::ColumnChart.new(@data_table, opts)
  end
end
