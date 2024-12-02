require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録の確認' do
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
    end
    it 'passwordが6文字未満では登録できない' do
      user = FactoryBot.build(:user)
      user.password = '000'
      user.valid?
    end
    it 'familyname_kanziが空では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = ''
      user.valid?
    end
    it 'familyname_kanziが漢字以外では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = 'わ'
      user.valid?
    end
    it 'firstyname_kanziが空では登録できない' do
      user = FactoryBot.build(:user)
      user.firstname_kanzi = ''
      user.valid?
    end
    it 'firstname_kanziが漢字以外では登録できない' do
      user = FactoryBot.build(:user)
      user.firstname_kanzi = 'わ'
      user.valid?
    end
    it 'familyname_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = ''
      user.valid?
    end
    it 'familyname_kanaがでカタカナ以外では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = '和'
      user.valid?
    end
    it 'firstname_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = ''
      user.valid?
    end
    it 'firstname_kanaがカタカナ以外では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = '和'
      user.valid?
    end
    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.familyname_kanzi = ''
      user.valid?
    end
  end
end