FactoryBot.define do
  factory :perm, class: Perm do
    title { Faker::Lorem.characters(number: 20) }
    detail { Faker::Lorem.characters(number: 500) }
    evaluation { Faker::Lorem.characters }
    perm_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png'), 'image/png') }
  end
end
