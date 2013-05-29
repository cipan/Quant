namespace :db do 
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'

		[Company, Product, Lead].each(&:delete_all)

		Company.populate 1 do |company|
			company.name = Populator.words(1).titleize
			Product.populate 1 do |product|
				product.name = Populator.words(1..3).titleize
				product.description = Populator.sentences(2..5)
				product.price = [4.99, 19.95, 100]
				product.category = Populator.words(1..5)
			end
			Lead.populate 10..25 do |lead|
				lead.name  = Faker::Company.name
				lead.phone = Faker::PhoneNumber.phone_number
				lead.address = " #{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip_code} "
				lead.total = rand(8000...10000)
				lead.success =  rand(400..8000)
 			end
		end
	end
end