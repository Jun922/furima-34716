require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品登録' do
    #正常系
    context '商品登録できる時' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end

      it '販売価格は、¥300~¥9,999,999の間のみ登録できること' do
        @item.price = "2000"
        expect(@item).to be_valid
      end

      it '販売価格は半角数字のみ登録できること' do
        @item.price = "2000"
        expect(@item).to be_valid
      end
    end

    #異常系
    context '商品登録できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end

      it 'categoryが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it 'sales statusが1では登録できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status must be other than 1"
      end

      it 'shipping fee statusが1では登録できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status must be other than 1"
      end

      it 'prefectureが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it 'scheduled deliveryが1では登録できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery must be other than 1"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'priceが9999999より大きくては登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'priceが300未満では登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end