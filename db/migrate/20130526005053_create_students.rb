class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :age_range
      t.string :sex
      t.string :nationality
      t.integer :psycho_demographic
      t.boolean :employed
      t.boolean :student
      t.integer :education_level
      t.integer :education_aos
      t.integer :income_level
      t.string  :enrollment
      t.string  :page_pass 
      t.string  :page_ver 
      t.references :lead
      t.timestamps
  	end
      add_foreign_key(:lead, :students)
      add_index :students, :lead_id
  end
end
