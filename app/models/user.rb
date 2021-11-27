class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Please set including both letters and numbers'

  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use double-byte characters'} do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Please use full-width katakana'} do
    validates :family_name_kana
    validates :first_name_kana
  end
  
  # validates :family_name, presence: true
  # validates :family_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true

  validates :nickname, presence: true
  validates :birth_day, presence: true
  
  
end