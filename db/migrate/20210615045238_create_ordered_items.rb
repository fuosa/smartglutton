class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|
      t.integer    :item_qty,      null: false
      t.integer    :item_status,   null: false
      t.integer    :bill,          null: false
      t.integer    :payment_type,  null: false
      t.integer    :received_type, null: false
      t.string     :phone,         null: false
      t.references :order,         null: false, foreign_key: true


      t.timestamps
    end
  end
end
