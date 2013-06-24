class CreateLeadSales < ActiveRecord::Migration
  def change
    create_table :lead_sales do |t|
    	t.decimal	 :price
    	t.references :student
    	t.references :affiliate
		t.timestamps
    end
    add_foreign_key(:student, :lead_sales)
    add_index :lead_sales, :student_id

    add_foreign_key(:affiliate, :lead_sales)
    add_index :lead_sales, :affiliate_id
  end
end
