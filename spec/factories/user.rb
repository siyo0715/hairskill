FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Lorem.characters(number: 20) }
    last_name { Faker::Lorem.characters(number: 20) }
    phone_number { Faker::Lorem.characters(number: 13) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
