require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、family_nameとfamily_name_kanafirst_nameとfirst_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "重複したメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "メールアドレスに@を含まない場合は登録できない" do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      # it "パスワードが6文字未満では登録できない" do
      #   @user.password = '12345'
      #   @user.password_confirmation = '12345'
      #   @user.valid?
        
      #   expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      # end
      it "英字のみのパスワードでは登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Please set including both letters and numbers")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = 'asdzxc'
        @user.password_confirmation = 'asdzxc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Please set including both letters and numbers')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Please set including both letters and numbers")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '12３456'
        @user.password_confirmation = '12３456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Please set including both letters and numbers")
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123iop'
        @user.password_confirmation = '123qwe'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Please use double-byte characters")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Please use double-byte characters")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Please use full-width katakana")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Please use full-width katakana")
      end
      
    end
  end
end