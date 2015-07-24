class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title
    	t.text :description
    	t.float :price
    	t.integer :sku
    	t.integer :category_id
      t.timestamps null: false
    end
  end
end
