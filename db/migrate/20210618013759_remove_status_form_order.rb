class RemoveStatusFormOrder < ActiveRecord::Migration[6.1]
  def change

    remove_column :ordered_items,  :item_status, :integer

    remove_column :ordered_items,  :bill,        :integer         
  end
end
