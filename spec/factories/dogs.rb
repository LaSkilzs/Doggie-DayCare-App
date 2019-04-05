FactoryBot.define do
  factory :dog do
    name { "MyString" }
    age { 1 }
    breed { "MyString" }
    size { "MyString" }
    restrictions { "dogfood" }
    friendliness { "friendly" }
    image { "MyString" }
    owner 
  end
end
