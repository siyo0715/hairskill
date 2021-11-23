FactoryBot.define do

  factory :perm, class: Perm do

    title { Faker::Lorem.characters(number: 20) }
    detail { Faker::Lorem.characters(number: 500) }
    evaluation { Faker::Lorem.characters }
    perm_image { File.open(File.join(Rails.root, 'spec/fixtures/sample.png')) }
  end
end