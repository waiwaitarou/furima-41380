class Shipping < ApplicationRecord
  validates :postal_code, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :prefecture_No, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :building_name
  validates :city, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  validates :tel_number, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :sale_record
end
