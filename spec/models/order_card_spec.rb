require 'rails_helper'

RSpec.describe OrderCard, type: :model do
  before do
    buying = FactoryBot.build(:buying)
    @order_card = FactoryBot.build(:order_card)
  end


  describe '商品購入データ保存' do
  #正常系
    context '購入履歴を保存できる場合' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@order_card).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_card.building = ''
        expect(@order_card).to be_valid
      end
    end

    #異常系
    context '購入履歴を保存できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_card.postal_code = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_card.postal_code = '1234567'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが空では保存できないこと' do
        @order_card.prefecture_id = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では保存できないこと' do
        @order_card.prefecture_id = 1
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityは空では保存できないこと' do
        @order_card.city = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("City can't be blank")
      end

      it 'addressは空では保存できないこと' do
        @order_card.address = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberは空では保存できないこと' do
        @order_card.phone_number = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは数字でないと登録できない' do
        @order_card.phone_number = '0000000000a'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Phone number is only 10 or 11 integer")
      end

      it '電話番号が1２桁以上だと登録できない' do
        @order_card.phone_number = '123412341234'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it "tokenが空では登録できないこと" do
        @order_card.token = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end