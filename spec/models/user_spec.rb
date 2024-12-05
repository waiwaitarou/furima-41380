require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録の確認' do
    context '新規登録が正常にできない場合'
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
      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'emailが過去のメールアドレスと重複した場合、登録できない' do
        @first_user = FactoryBot.create(:user, email:'test@test.com')
        @second_user = FactoryBot.build(:user, email:'test@test.com')
        @second_user.valid?
        expect(@second_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '0a0'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが英字だけの記述の場合、登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが数字だけの記述の場合、登録できない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordとpassword_confirmationが一致していない場合、登録できない' do
        @user.password = '111aaaa'
        @user.password_confirmation = '1221aaf' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordに全角文字を含んでいると登録できない' do
        @user.password = 'あいうau14'
        @user.password_confirmation = 'あいうau14'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'familyname_kanziが空では登録できない' do
        @user.familyname_kanzi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kanzi can't be blank"
      end
      it 'familyname_kanziが全角日本語以外では登録できない' do
        @user.familyname_kanzi = 'wagds'
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kanzi is invalid"
      end
      it 'firstyname_kanziが空では登録できない' do
        @user.firstname_kanzi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanzi can't be blank"
      end
      it 'firstname_kanziが全角日本語以外では登録できない' do
        @user.firstname_kanzi = 'galkf;na'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanzi is invalid"
      end
      it 'familyname_kanaが空では登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kana can't be blank"
      end
      it 'familyname_kanaがでカタカナ以外では登録できない' do
        @user.familyname_kana = '和'
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kana is invalid"
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it 'firstname_kanaがカタカナ以外では登録できない' do
        @user.firstname_kana = '和'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana is invalid"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    context '新規登録が正常に完了する場合'
      it '正しく情報が記入されていれば登録できる' do
        expect(@user).to be_valid
      end
  end
end