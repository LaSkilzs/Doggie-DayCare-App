require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name}
    email { Faker::Internet.unique.email }
    username { Faker::Internet.username(5) }
    role { "owner" }
    password_digest { "MyString" }
  end
end
