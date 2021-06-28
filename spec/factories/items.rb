FactoryBot.define do
  factory :item do
    item_name               {'test'}
    description             {1}
    price                   {11111}
    category_name           {1}
    category_status         {1}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
