class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
    	t.string :last_name
    	t.string :phone
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.boolean :opt_in
     	t.timestamps
    end
  end
end
