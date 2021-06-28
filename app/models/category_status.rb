class CategoryStatus < ActiveHash::Base

  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '新鮮' },
    { id: 2, name: '入荷から2,3日' },
    { id: 3, name: '入荷から4,5日' },
    { id: 4, name: '賞味期限切れ間近' },
    { id: 5, name: '要本日中の消費' }
  ]

include ActiveHash::Associations
has_many :items

end