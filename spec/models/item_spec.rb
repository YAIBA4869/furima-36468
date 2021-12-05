require 'rails_helper'

  RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品情報入力' do
      context '商品情報入力がうまくいく時' do
        it 'image、product_name、product_description、category_id、product_condition_id、shipping_charges_id、prefecture_id、days_to_ship_id、priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end
      context '商品情報の入力がうまくいかない時' do
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
      end
          it 'product_nameが空だと出品できない' do
            @item.product_name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Product name can't be blank")
          end
          it 'product_descriptionが空だと出品できない' do
            @item.product_description = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Product description can't be blank")
          end
          it 'category_idが空だと出品できない' do
            @item.category_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Category can't be blank")
          end
          it 'product_condition_idが空だと出品できない' do
            @item.product_condition_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Product condition can't be blank")
          end
          it 'shipping_charges_idが空だと出品できない' do
            @item.shipping_charges_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
          end
          it 'prefecture_idが空だと出品できない' do
            @item.prefecture_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture can't be blank")
          end
          it 'days_to_ship_idが空だと出品できない' do
            @item.days_to_ship_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Days to ship can't be blank")
          end
          it 'priceが空だと出品できない' do
            @item.price = nil
            # binding.pry
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end
          it 'priceが全角数字だと出品できないだと出品できない' do
            @item.price = "３００"
            @item.valid?
            expect(@item.errors.full_messages).to include("Price Input half-width characters")
          end
          it 'priceが設定範囲以外だと出品できない' do
            @item.price = "100000000"
            @item.valid?
            expect(@item.errors.full_messages).to include("Price out of setting range")
          end
      end
    end
  end

