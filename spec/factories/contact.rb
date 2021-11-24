FactoryBot.define do
  factory :contact, class: Contact do
    name { Faker::Lorem.characters(number: 15) }
    email { Faker::Lorem.characters(number: 50) }
    phone_number { Faker::Lorem.characters(number: 15) }
    subject { Faker::Lorem.characters(number: 11) }

    message { Faker::Lorem.characters(number: 200) }
  end
end
