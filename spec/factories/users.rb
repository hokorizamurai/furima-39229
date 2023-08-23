FactoryBot.define do
  factory :user do
    nickname                 {'test'}
    email                    {Faker::Internet.free_email}
    password                 {'3e3ekd'}
    password_confirmation    {password}
    last_name                {'山田'}
    first_name               {'太郎'}
    last_name_kana           {'ヤマダ'}
    first_name_kana          {'タロウ'}
    date_of_birth            {'1930-08-29'}
  end
end
