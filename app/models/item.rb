class Item < ApplicationRecord
  has_many :cart_items
  has_many :ordered_items
  belongs_to :categoryies
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
    validates :image
  end
end
