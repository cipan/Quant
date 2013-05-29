class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price
      t.string :category
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end