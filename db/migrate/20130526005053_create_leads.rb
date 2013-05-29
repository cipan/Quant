class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name 
      t.string :phone
      t.string :address
      t.decimal :total
      t.decimal :success
      t.timestamps
  	end
  end
end
