class OrderInfo
  include ActiveModel::Model
  attr_accessor :item_qty, :payment_type, :received_type, :phone, :user_id, :item_id


  with_options presence: true do 
    validates :item_qty, numericality: {other_than: 0, message: "can't be blank"}
    validates :payment_type, numericality: {other_than: 0, message: "can't be blank"}
    validates :received_type, numericality: {other_than: 0, message: "can't be blank"}
    validates :phone
    validates :user_id
    validates :item_id
  end

  def save 
    order = Order.create(user_id: user_id, item_id: item_id)

    OrderedItem.create(item_qty: item_qty, payment_type: payment_type, received_type: received_type, phone: phone, order_id: order.id)
  end

end