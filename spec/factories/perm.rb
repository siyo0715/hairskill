FactoryBot.define do

  factory :perm, class: Perm do

    title { Faker::Lorem.characters(number: 1) }
    detail { Faker::Lorem.characters(number: 20) }
    evaluation { Faker::Lorem.characters }
    perm_image { File.open(File.join(Rails.root, 'spec/fixtures/sample.png')) }
  end
end