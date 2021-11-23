FactoryBot.define do

  factory :cut, class: Cut do

    title { Faker::Lorem.characters(number: 20) }
    detail { Faker::Lorem.characters(number: 500) }
    evaluation { Faker::Lorem.characters }
    cut_image { File.open(File.join(Rails.root, 'spec/fixtures/sample.png')) }
  end
end