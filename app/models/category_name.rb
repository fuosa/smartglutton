class CategoryName < ActiveHash::Base

  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '野菜' },
    { id: 2, name: '果物' },
    { id: 3, name: '調理品' },
    { id: 4, name: '調味料' },
    { id: 5, name: 'お米、パン、麺類' },
    { id: 6, name: 'その他' }
  ]

include ActiveHash::Associations
has_many :items

end