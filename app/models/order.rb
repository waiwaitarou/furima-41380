class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :prefecture, :postal_code, :prefecture_No, :building_name, :city, :tel_number, :sale_record, :user, :item, :token

  validates :prefecture, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
  validates :prefecture_No, presence: true, numericality: { only_integer: true }
  validates :tel_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  validates :building_name, presence: true
  validates :city, presence: true
  validates :token, presence: true

  def save
    order = SaleRecords.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, tel_number: tel_number, building_name: building_name, sale_record: sale_record, prefecture_No: prefecture_No)
  end

  belongs_to :item
  belongs_to :user
end
