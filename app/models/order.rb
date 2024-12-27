class Order
  include ActiveModel::Model
  attr_accessor :prefecture, :postal_code, :prefecture_No, :building_name, :city, :tel_number, :sale_record, :user, :item

  validates :prefecture, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :prefecture_No, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :tel_number, presence: true, format: {with: /\A\d+-\d+-\d+\Z/}
  validates :building_name, presence: true
  validates :city, presence: true

  def save
    order = SaleRecords.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, tel_number: tel_number, building_name: building_name, sale_record: sale_record, prefecture_No: prefecture_No)
  end
end
