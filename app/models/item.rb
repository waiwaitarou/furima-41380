class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :sale_name, presence: true
  validates :explanatation, presence: true
  validates :cotegory_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: {with: /\A[0-9]+\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :cotegory
  has_many :prefecture
  has_many :state
  has_many :shipping_fee
  has_many :shipping_day
end
