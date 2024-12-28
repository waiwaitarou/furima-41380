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
        expect(@order.errors.full_messages).to include "Sale name can't be blank"
      end
      it 'postal_codeが空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "postal code can't be blank"
      end
      it 'postal_codeが数字以外では登録できない' do
        @order.postal_code = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include "postal code can't be blank"
      end
      it 'prefecture_NOが空では登録できない' do
        @order.prefecture_No = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "prefecture No can't be blank"
      end
      it 'prefecture_NOが数字以外では登録できない' do
        @order.prefecture_No = 'd'
        @order.valid?
        expect(@order.errors.full_messages).to include "prefecture No can't be blank"
      end
      it 'tel_numberが空では登録できない' do
        @order.tel_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "tel number can't be blank"
      end
      it 'tel_numberが数字以外では登録できない' do
        @order.tel_number = 'a'
        @order.valid?
        expect(@order.errors.full_messages).to include "tel number can't be blank"
      end
      it 'building_nameが空では登録できない' do
        @order.building_name = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "building name can't be blank"
      end
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@item.errors.full_messages).to include "city can't be blank"
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "priceが空では保存ができないこと" do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
      it "user_idが空では保存ができないこと" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("user_id can't be blank")
      end
      it 'orderが紐づいていない場合、登録できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item must exist"
      end
    context '商品購入商品購入が正常に完了する場合'
      it '正しく情報が記入されていれば購入できる' do
        expect(@order).to be_valid
      end
  end
end