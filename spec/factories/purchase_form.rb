FactoryBot.define do
  factory :purchase_form do
    user_id { '1' }
    item_id { '1' }
    postal_code {'123-4567'}
    city {'愛知県'}
    prefecture_id {'2'}
    addresses {'1-1'}
    building {'新宿ビル'}
    phone_number {'12312341234'}
    token { 'tok_abcdefghijk00000000000000000' }
    # association :purchase_record
  end
end
