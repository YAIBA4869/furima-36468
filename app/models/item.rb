class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :purchase_record
  

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :price, presence: true
  validates :shipping_charges_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  validates :user, presence: true
end
