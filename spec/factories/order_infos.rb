FactoryBot.define do
  factory :order_info do
    item_qty { 1 }
    payment_type { 1 }
    received_type { 1 }
    phone { '09012345678' }
    
  end
end