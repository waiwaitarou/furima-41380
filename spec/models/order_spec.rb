require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入の確認' do
    context '商品購入が失敗した場合'
      it 'prefectureが未選択では登録できない' do
        @order.prefecture = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'postal_codeが空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが数字以外では登録できない' do
        @order.postal_code = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code is invalid"
      end
      it 'prefecture_NOが空では登録できない' do
        @order.prefecture_No = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture no can't be blank"
      end
      it 'prefecture_NOが数字以外では登録できない' do
        @order.prefecture_No = 'd'
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture no is not a number"
      end
      it 'tel_numberが空では登録できない' do
        @order.tel_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Tel number can't be blank"
      end
      it 'tel_numberが数字以外では登録できない' do
        @order.tel_number = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include "Tel number is invalid"
      end
      it 'building_nameが空では登録できない' do
        @order.building_name = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Building name can't be blank"
      end
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
      it 'itemが紐づいていない場合、登録できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item must exist"
      end
      it 'userが紐づいていない場合、登録できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User must exist"
      end
    context '商品購入商品購入が正常に完了する場合'
      it '正しく情報が記入されていれば購入できる' do
        expect(@order).to be_valid
      end
  end
end