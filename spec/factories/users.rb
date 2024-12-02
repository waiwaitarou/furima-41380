FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    familyname_kanzi      {'和'}
    firstname_kanzi       {'高'}
    familyname_kana       {'ワ'}
    firstname_kana        {'コウ'}
    birthday              {'1999年10月7日'}
  end
end