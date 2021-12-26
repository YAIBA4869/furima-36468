require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'postal_code、prefecture_id、city、addresses、phone_number' do
        expect(@purchase_form).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみでないと保存できないこと' do
        @purchase_form.postal_code = '１２３－４５６７'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-), Input half-width characters")
      end
      it '都道府県が「---」だと保存できないこと' do
        @purchase_form.prefecture_id = "1"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_form.addresses = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値でないと保存できないこと' do
        @purchase_form.phone_number = '１２３１２３４１２３４'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number, Input half-width characters")
      end
      it 'トークンが空だと保存できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end