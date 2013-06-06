class CreateClients < ActiveRecord::Migration
  def change
  	create_table :clients do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email_address
  		t.string :phone
  		t.integer :highest_level_of_education
  		t.string :enroll
      t.references :company
      t.references :lead
      t.timestamps
  		end
      add_foreign_key(:company, :clients)
      add_foreign_key(:lead, :clients)
      add_index :clients, :lead_id
	end
end