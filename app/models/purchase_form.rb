class PurchaseForm
  include ActiveModel::Model
  attr_accessor :purchase_record_id, :postal_code, :city, :prefecture_id, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-), Input half-width characters"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid. Input only number, Input half-width characters"}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Purchase.create(purchase_record_id: purchase_record.id, postal_code: postal_code, city: city, prefecture_id: prefecture_id, addresses: addresses, building: building, 
      phone_number: phone_number)

  end
end