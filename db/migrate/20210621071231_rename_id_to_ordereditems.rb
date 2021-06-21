class RenameIdToOrdereditems < ActiveRecord::Migration[6.1]
  def change
    rename_column :ordered_items, :item_qty, :item_qty_id
    rename_column :ordered_items, :payment_type, :payment_type_id
    rename_column :ordered_items, :received_type, :received_type_id
  end
end
