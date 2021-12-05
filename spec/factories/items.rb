FactoryBot.define do
  factory :item do
    product_name             {'商品名'}
    product_description      {'説明'}
    category_id              {"2"}
    product_condition_id     {"2"}
    shipping_charges_id      {"2"}
    prefecture_id            {"2"}
    days_to_ship_id          {"2"} 
    price                    {"300"}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/bicycle3.jpg'), filename: 'bicycle3')
    end

  end
end


# egory_id { "can't be blank"}
#     product_condition_id  { "1"}
#     shipping_charges_id  { "1"}
#     prefecture_id  { "1"}
#     days_to_ship_id  { "1"}