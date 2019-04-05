FactoryBot.define do
  factory :dog do
    name { "MyString" }
    age { 1 }
    breed { "MyString" }
    size { "MyString" }
    restrictions { "MyString" }
    friendliness { "MyString" }
    image { "MyString" }
    owner 
  end
end
