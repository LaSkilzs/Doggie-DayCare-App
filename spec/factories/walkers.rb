
FactoryBot.define do
  factory :walker do
    age { rand(16..50) }
    experience { "MyString" }
    own_dog { "MyString" }
    rating { rand(1..5) }
    user 
  end
end
