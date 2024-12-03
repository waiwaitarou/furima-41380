class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX } 
  validates :nickname, presence: true
  validates :familyname_kanzi, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :firstname_kanzi, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :familyname_kana, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :firstname_kana, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :birthday, presence: true
end
