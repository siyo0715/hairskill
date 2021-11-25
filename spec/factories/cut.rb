FactoryBot.define do
  factory :cut, class: Cut do
    title { Faker::Lorem.characters(number: 20) }
    detail { Faker::Lorem.characters(number: 500) }
    evaluation { Faker::Lorem.characters }
    cut_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png'), 'image/png') }
  end
end
