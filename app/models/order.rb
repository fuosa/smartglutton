class Order < ApplicationRecord 
  has_one :ordered_item
  belongs_to :user
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :payment_type
  belongs_to :received_type

end
