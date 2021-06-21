class PaymentType < ActiveHash::Base

  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '現金' },
    { id: 2, name: 'クレジットカード' }
  ]

include ActiveHash::Associations
has_many :orders

end