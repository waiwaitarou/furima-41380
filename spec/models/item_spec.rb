require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の確認' do
    context '商品出品が成功した場合'
      it 'sale_nameが空では登録できない' do
        @item.sale_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Sale name can't be blank"
      end
      it 'explanatationが空では登録できない' do
        @item.explanatation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanatation can't be blank"
      end
      it 'cotegory_idが空では登録できない' do
        @item.cotegory_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Cotegory can't be blank"
      end
      it 'state_idが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが数字以外では登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    context '新規登録が正常に完了する場合'
      it '正しく情報が記入されていれば登録できる' do
        expect(@item).to be_valid
      end
  end
end