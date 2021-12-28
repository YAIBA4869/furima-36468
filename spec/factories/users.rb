FactoryBot.define do
  factory :user do
    nickname              {'test'}
    # email                 {'test@test.com'}
    email                 {Faker::Internet.free_email}
    password              {'12d456'}
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_kana      {'ヤマダ'} 
    first_name_kana      {'タロウ'} 
    birth_day             {'2000-01-01'}
  end
end

