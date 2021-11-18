FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    family_name           {'test'}
    first_name            {'test'}
    family_name_kana      {'test'} 
    first_name_kana      {'test'} 
    birth_day             {'2000-01-01'}
  end
end

