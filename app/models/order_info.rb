class OrderInfo
  include ActiveModel::Model
  attr_accessor :item_qty, :item_status, :bill, :payment_type, :receive_type, :phone, :user_if, :item_id

  with_options presence: true do
    validates :item_qty
    validates :item_status
    validates :bill
    validates :payment_type
    validates :receive_type
    validates :phone
  end

  with_options numericality: {other_than: 0, message: "can't be blank"} do
    validates :item_qty
    validates :item_status
    validates :bill
    validates :payment_type
    validates :receive_type
    validates :phone
  end

  def save 
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderedItem.create(item_qty: item_qty, payment_type: payment_type, receive_type: receive_type, phone: phone, order_id: order.id)
  end
end