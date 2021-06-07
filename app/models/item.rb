class Item < ApplicationRecord
  has_many :cart_items
  has_many :ordered_items
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_name
    validates :category_status
    validates :price
    validates :image
    validates :user_id
  end
end
