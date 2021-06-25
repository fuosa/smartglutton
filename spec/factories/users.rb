FactoryBot.define do
  factory :user do
    nickname {'トム123'}
    last_name { '田中' }
    first_name { '一郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'イチロウ' }
    date_of_birth { '1980-01-01' }
    email { 'test@test'}
    password { 'a00000'}
    password_confirmation { 'a00000' }
  end
end
