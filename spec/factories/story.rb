FactoryBot.define do
  factory :story do
    story_comment { Faker::Lorem.characters(number:200) }
    user
    line
  end
end