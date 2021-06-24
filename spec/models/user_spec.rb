require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    #正常系
    context '新規登録できる時' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'emailが＠つきであれば登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上半角英数字であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end

      it 'family_nameとfirst_nameが全角であれば登録できる' do
        @user.family_name = 'てすと'
        @user.first_name = 'てすと'
        expect(@user).to be_valid
      end

      it 'family_name_kanaとfirst_name_kanaが全角カナであれば登録できる' do
        @user.family_name_kana = 'テスト'
        @user.first_name_kana = 'テスト'
        expect(@user).to be_valid
      end
    end

    #異常系
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
        
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
        
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
        
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end