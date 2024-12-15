FactoryBot.define do
  factory :item do
    sale_name       {'まつ'}
    explanatation   {'まつは高い'}
    cotegory_id     {3}
    state_id        {2}
    shipping_day_id {2}
    shipping_fee_id {2}
    prefecture_id   {2}
    price           {1000}
    association :user
  end
end