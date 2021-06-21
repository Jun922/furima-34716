require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: 'qqq000', password_confirmation: 'qqq000', family_name: 'てすと', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: 'qqq000', password_confirmation: 'qqq000', family_name: 'てすと', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'encrypted_passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: 'qqq000', family_name: 'てすと', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'password_confirmationが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'qqq000', password_confirmation: '', family_name: 'てすと', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'qqq000', password_confirmation: 'qqq000', family_name: '', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
    end

    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'qqq000', password_confirmation: 'qqq000', family_name: 'てすと', first_name: '', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_name_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'qqq000', password_confirmation: 'qqq000', family_name: 'てすと', first_name: 'テスト', family_name_kana: '', first_name_kana: 'テスト', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana is invalid")
    end

    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'qqq000', password_confirmation: 'qqq000', family_name: 'てすと', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: '', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'qqq000', password_confirmation: 'qqq000', family_name: 'てすと', first_name: 'テスト', family_name_kana: 'テスト', first_name_kana: 'テスト', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
