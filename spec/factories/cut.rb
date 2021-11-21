FactoryBot.define do

  factory :cut, class: Cut do

    title { Faker::Lorem.characters(number: 1) }
    detail { Faker::Lorem.characters(number: 20) }
    evaluation { Faker::Lorem.characters }
    cut_image { Faker::Lorem.characters }
  end
end