require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    # 正常系
    context '新規登録できる時' do
      it 'nicknameが存在すれば登録できる' do
      end
      it 'emailが＠つきであれば登録できる' do
      end
      it 'passwordとpassword_confirmationが6文字以上半角英数字であれば登録できる' do
      end
      it 'family_naemとfirst_nameが全角であれば登録できる' do
      end
      it 'family_naem_kanaとfirst_name_kanaが全角カナであれば登録できる' do
      end
      it 'birthdayが存在すれば登録できる' do
      end
    end

    #異常系
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    
    it 'password_confirmationが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'family_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "Family name is invalid"
    end
    
    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "First name is invalid"
    end

    it 'family_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "Family name kana is invalid"
    end
    
    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "First name kana is invalid"
    end

    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end