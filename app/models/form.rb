class Form
  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :region_of_origin, :building_name, :city, :tel_number, :sell_record, :user_id, :item_id, :token, :item, :user

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :region_of_origin
    validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :city
    validates :token
  end

  def save
    sell_record = SellRecord.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, tel_number: tel_number, building_name: building_name, sell_record: sell_record, region_of_origin: region_of_origin)
  end
end