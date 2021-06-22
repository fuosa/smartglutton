class OrderInfo
  include ActiveModel::Model
  attr_accessor :item_qty_id, :payment_type_id, :received_type_id, :phone, :user_id, :item_id

  with_options presence: true do
    validates :item_qty_id
    validates :payment_type_id
    validates :received_type_id
    validates :phone
    validates :user_id
    validates :item_id
  end

  with_options numericality: {other_than: 0, message: "can't be blank"} do
    validates :item_qty_id
    validates :payment_type_id
    validates :received_type_id
  end

  def save 
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderedItem.create(item_qty_id: item_qty_id, payment_type_id: payment_type_id, received_type_id: received_type_id, phone: phone, order_id: order.id)
  end
end