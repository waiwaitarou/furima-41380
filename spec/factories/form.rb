FactoryBot.define do
  factory :form do
    prefecture_id    {5}
    postal_code   {"123-4567"}
    region_of_origin {5}
    tel_number    {6965481125}
    building_name {'松の木'}
    city          {'福山'}
    token         {'tok_abcdefghijk00000000000000000'}
  end
end