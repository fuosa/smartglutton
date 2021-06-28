class RenameCategoryColumnToItems < ActiveRecord::Migration[6.1]
  def change

    rename_column :items, :category_name, :category_name_id
    rename_column :items, :category_status, :category_status_id


  end
end
