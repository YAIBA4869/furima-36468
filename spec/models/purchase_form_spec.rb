require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報' do
    context '全ての項目が入力されていれば購入できる' do
      it 'postal_code、prefecture_id、city、addresses、phone_number' do
        expect(@purchase_form).to be_valid
      end
    end
    context '購入情報ができないとき' do
      it 'userが紐付いていなければ購入できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @purchase_form.item_id = nil
        # binding.pry
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみでないと購入ができない' do
        @purchase_form.postal_code = '１２３－４５６７'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-), Input half-width characters")
      end
      it '都道府県が「---」が選択されている場合は購入ができない' do
        @purchase_form.prefecture_id = "1"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと購入ができない' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入ができない' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入ができない' do
        @purchase_form.addresses = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと購入ができない' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_form.phone_number = '123４56789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number, Input half-width characters")
      end
      it '電話番号は、9桁以下では購入ができない' do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number, Input half-width characters")
      end
      it '電話番号は、12桁以上では購入ができない' do
        @purchase_form.phone_number = '123123412345'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number, Input half-width characters")
      end
      it 'トークンが空だと購入ができない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end