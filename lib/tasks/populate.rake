namespace :db do 
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'foreigner'

		[Company, Lead, Client].each(&:delete_all)

		2.times do
			company = Company.create( name: Faker::Company.name, product_name: Faker::Company.name)

			(4).times do
				lead = Lead.create(
					name: Faker::Company.name,
					phone: Faker::PhoneNumber.phone_number,
					address: " #{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip_code} ",
					total: rand(8000...10000),
					success:  rand(400..8000))
				

	 			(3).times do
	 				string = ""
	 				48.times do 
				  		possible = [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
				  		if string[-2, 2] =~ /\s*0\s*/  
							string << "0 "
						else
				  			string << "#{possible[Random.rand(0..99)]} "
				  		end
				  	end

	 				client = Client.create(	 				
		 				first_name: Faker::Name.first_name,
					  	last_name: Faker::Name.last_name,
					  	email_address: Faker::Internet.email,
					  	phone: Faker::PhoneNumber.phone_number,
					  	highest_level_of_education: rand(1..9),
					  	enroll: string)

			  	end
			end
			
		end
	end
end