FactoryBot.define do

  factory :blog, class: Blog do

    title { Faker::Lorem.characters(number: 15) }
    content { Faker::Lorem.characters(number: 200) }

  end
end