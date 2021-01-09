FactoryBot.define do
  factory :user do
    uid {Faker::Alphanumeric.alphanumeric(number: 12)}
    email {Faker::Internet.email}
    name {Faker::Name.name}
    token {Faker::Alphanumeric.alphanumeric(number: 12)}
  end
end