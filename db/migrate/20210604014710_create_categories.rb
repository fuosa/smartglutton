class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer  :category_name,   null: false
      t.integer  :category_status, null: false
      t.timestamps
    end
  end
end
