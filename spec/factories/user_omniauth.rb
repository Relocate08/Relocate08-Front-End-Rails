require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    uid { Faker::Number.within(range: 100_000..999_999) }
    token { Faker::Number.within(range: 100_000..999_999) }
  end

  factory :omniauth_mock_user, parent: :user do
    name { 'Jimmy Neutron' }
    email { 'john@example.com' }
    uid { '100000000000000000000' }
    token { 'MOCK_OMNIAUTH_GOOGLE_TOKEN' }
  end
end
