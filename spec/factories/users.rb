FactoryBot.define do
  factory :user do
    nickname {'トム123'}
    last_name { '田中' }
    first_name { '一郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'イチロウ' }
    data_of_birth { '1980-01-01' }
    email { 'test@test'}
    password { 'test12345'}
    password_confirmation { password }
  end
end
