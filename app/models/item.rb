class Item < ApplicationRecord
  has_one :orders
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_name
    validates :category_status
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_name
    validates :category_status
  end

end
