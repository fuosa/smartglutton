class OrderInfo
  include AciveModel::Model
  attr_accesor :item_qty, :payment_type, :received_type, :phone, :user_id, :item_id


  with_optipns presence: true do 
    validates :item_qty, numericality: {other_than: 0, message: "can't be blank"}
    validates :payment_type, numericality: {other_than: 0, message: "can't be blank"}
    validates :received_type, numericality: {other_than: 0, message: "can't be blank"}
    valisates :phone
    validates :user_id
    validates :item_id
  end

  


end