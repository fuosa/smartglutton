class RemoveColumnsInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :post_code, :string
    remove_column :users, :prefecture_id, :inteer
    remove_column :users, :city, :string
    remove_column :users, :house_number, :string
    remove_column :users, :building_name, :string
    remove_column :users, :phone, :string
    
  end
end
