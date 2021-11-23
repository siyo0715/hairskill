FactoryBot.define do

  factory :color, class: Color do

    title { Faker::Lorem.characters(number: 1) }
    detail { Faker::Lorem.characters(number: 20) }
    evaluation { Faker::Lorem.characters }
    color_image { File.open(File.join(Rails.root, 'spec/fixtures/sample.png')) }
  end
end