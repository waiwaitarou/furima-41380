require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入の確認' do
    context '商品購入が失敗した場合' do
      it 'prefectureが未選択では登録できない' do
        @form.prefecture = 1
        @form.valid?
        expect(@form.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'postal_codeが空では登録できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンが含まれていないと登録できない' do
        @form.postal_code = '4568852'
        @form.valid?
        expect(@form.errors.full_messages).to include "Postal code is invalid. Enter it as follows (e.g. 123-4567)"
      end
      it 'prefecture_NOが空では登録できない' do
        @form.prefecture_No = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "Prefecture no can't be blank"
      end
      it 'tel_numberが空では登録できない' do
        @form.tel_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "Tel number can't be blank"
      end
      it 'tel_numberに数字以外が含まれていると登録できない' do
        @form.tel_number = '59665d565'
        @form.valid?
        expect(@form.errors.full_messages).to include "Tel number is invalid"
      end
      it 'tel_numberが9桁以下だと登録できない' do
        @form.tel_number = 545446
        @form.valid?
        expect(@form.errors.full_messages).to include "Tel number is invalid"
      end
      it 'tel_numberが12桁以上だと登録できない' do
        @form.tel_number = 865456786454546
        @form.valid?
        expect(@form.errors.full_messages).to include "Tel number is invalid"
      end
      it 'cityが空では登録できない' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "City can't be blank"
      end
      it "tokenが空では登録できないこと" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include "Token can't be blank"
      end
      context '商品購入商品購入が正常に完了する場合' do
        it '正しく情報が記入されていれば購入できる' do
          expect(@form).to be_valid
        end
      end
    end
  end
end