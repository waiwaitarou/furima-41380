FactoryBot.define do
  factory :user do
    sale_name       {'まつ'}
    explanation     {'まつは高い'}
    cotegory_id     {'メンズ'}
    state_id        {'新品・未使用'}
    shipping_day_id {'4~7日で発送'}
    shipping_fee_id {'着払い（購入者負担）'}
    prefecture_id   {'山形県'}
    price           {'1000'}
  end
end