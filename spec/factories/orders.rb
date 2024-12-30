FactoryBot.define do
  factory :order do
    prefecture    {5}
    postal_code   {'950-2006'}
    prefecture_No {5}
    tel_number    {'07045664454'}
    building_name {'ものさし'}
    city          {'福山'}
    token         {'tok_abcdefghijk00000000000000000'}
    association :item
    association :user
  end
end