class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
    	t.string :name 
    	t.string :phone
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.timestamps
    end
  end
end
