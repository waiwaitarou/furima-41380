class  Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :prefecture, :postal_code, :prefecture_No, :building_name, :city, :tel_number, :sale_record, :user, :item

  validates :postal_code, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :prefecture_No, presence: true
  validates :tel_number, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :building_name, presence: true
  validates :city, presence: true

  belongs_to :item
end