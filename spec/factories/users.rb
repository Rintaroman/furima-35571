FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    name                  {'山田'}
    first_name            {'太郎'}
    name_kana             {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-1-1'}
  end
end