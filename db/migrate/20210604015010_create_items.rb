class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string      :item_name,       null: false
      t.text        :description,     null: false
      t.integer     :price,           null: false
      t.integer     :category_name,   null: false
      t.integer     :category_status,  null: false
      t.references  :user,  foreign_key: true, null: false
      

      t.timestamps
    end
  end
end
