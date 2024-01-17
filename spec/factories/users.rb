FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'鈴木'}
    first_name {'太郎'}
    last_name_kana {'スズキ'}
    first_name_kana {'タロウ'}
    birthday {'20001020'}
  end
end
