namespace :db do 
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'foreigner'

		[Student, Lead, LeadSale, Affiliate].each(&:delete_all)
 
		10000.times do |t|
			lead = Lead.create(
				first_name: Faker::Name.first_name,
				last_name: Faker::Name.last_name,
				phone: Faker::PhoneNumber.phone_number,
				address: Faker::Address.street_address,
				city: Faker::Address.city,
				state: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"].sample,
				zip: Faker::Address.zip_code,
				opt_in: true)
			
			sex = ["Male", "Female"].sample
			nation =  ["Caucasian", "African American", "Asian", "Hispanic", "Native American", "Indian" ].sample
			psy_dem = rand(1...5)
			age = rand(1...5)
			income = rand(1...5)

			enroll = ""
			if sex == "Female" || psy_dem == 4 || age == 2 || income == 5
				enroll_possible = [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
			elsif  psy_dem == 1 || age == 4 || income == 1
				enroll_possible = [0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
			elsif age == 5 || sex == "Male"
				enroll_possible = [0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
			else
				enroll_possible = [0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
			end

	 		48.times do 

				if enroll[-2, 2] =~ /\s*0\s*/  
					enroll << "0 "
				else
					enroll << "#{enroll_possible[Random.rand(0..99)]} "
				end
			end

			page = ""
	 		if nation == "Asian"
				page_possible = [0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
			else
				page_possible = [0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]				
			end
	 		
	 		6.times do
				if page[-2, 2] =~ /\s*0\s*/  
					page << "0 "
				else
					page << "#{page_possible[Random.rand(0..99)]} "
				end
			end

			lead.create_student(
				age_range: age,
				sex: sex,
				nationality: nation,
				psycho_demographic: psy_dem, 
				employed: true, 
				student: true, 
				education_level:rand(1...6), 
				education_aos: rand(1...5),
				income_level: income,
				enrollment: enroll,
				page_pass: page,
				page_ver: ['A', 'B'].sample)
			if t%250 == 0
				puts "Created lead number #{t}."
			end
		end
			250.times do
				Affiliate.create(
					name: Faker::Company.name, 
					phone: Faker::PhoneNumber.phone_number,
					address: Faker::Address.street_address,
					city: Faker::Address.city,
					state: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"].sample,
					zip: Faker::Address.zip_code)
			end

			Student.all.each do |student|
				affiliate = Affiliate.all.sample
				affiliate.purchase(45, student)
			end

	end
end