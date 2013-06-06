class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name 
      t.string :phone
      t.string :address
      t.decimal :total
      t.decimal :success
      t.references :company
      t.timestamps
  	end
      add_foreign_key(:company, :leads)
      add_index :leads, :company_id
  end
end
