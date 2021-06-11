FactoryBot.define do
  factory :line, class: Line do
    content { Faker::Lorem.characters(number:200) }
    book_title { Faker::Lorem.characters(number:20) }
  end
end
