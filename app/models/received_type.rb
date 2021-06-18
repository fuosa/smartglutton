class ReceivedType < ActiveHash::Base

  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '店舗受け取り' },
    { id: 2, name: 'その他（コメント欄から連絡）' }
  ]

include ActiveHash::Associations
has_many :order

end