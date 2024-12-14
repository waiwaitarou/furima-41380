class Items < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :sale_name, :string, presence: true
  validates :explanation, :text, presence: true
  validates :cotegory_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :State_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :Shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :Prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: {with: /\A[0-9]+\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :cotegory
  has_many :prefecture
  has_many :state
  has_many :shipping_fee
  has_many :Shipping_day
end
