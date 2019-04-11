FactoryBot.define do
  factory :service do
    name { "daycare" }
    category { "rate" }
    package { "best" }
    bundle { "five"}
    max_time { "half" }
    pkg_amount { 1.5 }
    hourly_rate { 1.5 }
  end
end
 
 