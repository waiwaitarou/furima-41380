require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '高', familyname_kana: 'ワ', firstname_kana: 'コウ', birthday: '1999年10月7日')
      user.valid?
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'wa', email: '', password: '000000', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '高', familyname_kana: 'ワ', firstname_kana: 'コウ', birthday: '1999年10月7日')
      user.valid?
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'wa', email: 'test@example', password: '', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '高', familyname_kana: 'ワ', firstname_kana: 'コウ', birthday: '1999年10月7日')
      user.valid?
    end
    it 'familyname_kanziが空では登録できない' do
      user = User.new(nickname: 'wa', email: 'test@example', password: '000000', password_confirmation: '000000', familyname_kanzi: '', firstname_kanzi: '高', familyname_kana: 'ワ', firstname_kana: 'コウ', birthday: '1999年10月7日')
      user.valid?
    end
    it 'firstname_kanziが空では登録できない' do
      user = User.new(nickname: 'wa', email: 'test@example', password: '000000', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '', familyname_kana: 'ワ', firstname_kana: 'コウ', birthday: '1999年10月7日')
      user.valid?
    end
    it 'familyname_kanaが空では登録できない' do
      user = User.new(nickname: 'wa', email: 'test@example', password: '000000', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '高', familyname_kana: '', firstname_kana: 'コウ', birthday: '1999年10月7日')
      user.valid?
    end
    it 'firstname_kanaが空では登録できない' do
      user = User.new(nickname: 'wa', email: 'test@example', password: '000000', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '高', familyname_kana: 'ワ', firstname_kana: '', birthday: '1999年10月7日')
      user.valid?
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'wa', email: 'test@example', password: '000000', password_confirmation: '000000', familyname_kanzi: '和', firstname_kanzi: '高', familyname_kana: 'ワ', firstname_kana: 'コウ', birthday: '')
      user.valid?
    end
  end
end