FactoryBot.define do
  factory :order do
    prefecture    {'香川県'}
    postal_code   {8705401}
    prefecture_No {655}
    tel_number    {09054554462}
    building_name {'ものさし'}
    city          {'福山'}
    association :item

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/situmonn.png'), filename: 'test_image.png')
    end
  end
end