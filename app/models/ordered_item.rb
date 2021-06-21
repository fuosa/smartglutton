class OrderedItem < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_qty_id

end
