class Item < ApplicationRecord
  belongs_to :user
  # belongs_to :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_condition
  belongs_to :category
  belongs_to :shipping_charges
  
  with_options presence: true do
    validates :image
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Input half-width characters" }

  validates :product_name, presence: true
  validates :product_description, presence: true
  
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}

  
end
