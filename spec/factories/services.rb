FactoryBot.define do
  factory :service do
    name { "daycare" }
    type { "rate" }
    package { "best" }
    max_time { 15 }
    pkg_amount { 1.5 }
    hourly_rate { 1.5 }
  end
end
 