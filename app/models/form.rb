class Form
  include ActiveModel::Model
  attr_accessor :prefecture, :postal_code, :prefecture_No, :building_name, :city, :tel_number, :sell_record, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
    validates :item_id
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :prefecture_No, presence: true
    validates :tel_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :building_name, presence: true
    validates :city, presence: true
    validates :token, presence: true
  end

  def save
    sell_record = SellRecord.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture, city: city, tel_number: tel_number, building_name: building_name, sell_record: sell_record, prefecture_No: prefecture_No)
  end
end