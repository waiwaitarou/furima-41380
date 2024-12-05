FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'000aaaa'}
    password_confirmation {'000aaaa'}
    familyname_kanzi      {'和'}
    firstname_kanzi       {'高'}
    familyname_kana       {'ワ'}
    firstname_kana        {'コウ'}
    birthday              {'1999-10-7'}
  end
end