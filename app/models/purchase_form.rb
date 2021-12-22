class PurchaseForm
  include ActiveModel::Model
  attr_accessor :purchase_record_id, :postal_code, :city, :prefecture_id, :addresses, :building, :phone_number, :user_id, :item_id

with_options presence: true do
    # validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postal code is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city#, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is too short"}
  end
  validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid. Input only number"}

  

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_recode = PurchaseRecodes.create(user_id: user_id, item_id: item_id)
    Purchases.create(postal_code: postal_code, city: city, prefecture_id: prefecture_id, addresses: addresses, building: building, phone_number: phone_number, purchases_id: purchases.id)

  end
end