class Order < ApplicationRecord 
  has_one :ordered_item
  belongs_to :user
  belongs_to :item
end
