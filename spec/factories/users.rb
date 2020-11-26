FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    introduction { Faker::Lorem.sentence }
    birth_day { Faker::Date.birthday }
    address { Faker::Address.city }
  end
end
