FactoryBot.define do
  factory :form do
    prefecture    {5}
    postal_code   {'656-3214'}
    prefecture_No {5}
    tel_number    {'6965481125'}
    building_name {'ものさし'}
    city          {'福山'}
    token         {'tok_abcdefghijk00000000000000000'}
    association :item
    association :user
  end
end