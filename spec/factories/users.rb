FactoryGirl.define do
  factory :user do
    id Faker::Number.number(3)
    name Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password(8)
  end
end
