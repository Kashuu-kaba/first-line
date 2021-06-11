FactoryBot.define do
  factory :user do
    # class: User
    name { Faker::Lorem.characters(number:20) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number:20) }
  end
end