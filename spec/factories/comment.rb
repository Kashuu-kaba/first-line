FactoryBot.define do
  factory :comment do
    line_comment { Faker::Lorem.characters(number:50) }
    user
    line
  end
end