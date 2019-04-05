FactoryBot.define do
  factory :invoice do
    amount { 100.00 }
    appointment 
    owner
    walked { "MyString" }
    walk_rating { rand(1..5) }
    notes { "MyString" }
    owner_comments { "MyString" }
    walker_comments { "MyString" }
  end
end
