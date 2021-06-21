class Order < ApplicationRecord 
  has_one :ordered_item
  belongs_to :user
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :payment_type_id
  belongs_to :received_type_id
  belongs_to :item_qty_id


end
