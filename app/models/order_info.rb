class OrderInfo
  include ActiveModel::modules
  attr_accessor :item_qty, :item_status, :bill, :payment_type, :receive_type, :phone, :user_if, :item_id
end