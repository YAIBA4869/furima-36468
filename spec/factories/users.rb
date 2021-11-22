FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test.com'}
    password              {'12d456'}
    password_confirmation {password}
    family_name           {'TEST'}
    first_name            {'TEST'}
    family_name_kana      {'カナ'} 
    first_name_kana      {'カナ'} 
    birth_day             {'2000-01-01'}
  end
end

