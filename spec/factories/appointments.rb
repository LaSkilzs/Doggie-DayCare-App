FactoryBot.define do
  factory :appointment do
    date { "2019-04-04" }
    start_time { "18:46:22" }
    status { "pending" }
    dog 
    walker 
    service
  end
end
