FactoryBot.define do
  factory :service do
    name { "daycare" }
    category { "rate" }
    package { "best" }
    bundle { 15}
    max_time { 15 }
    pkg_amount { 1.5 }
    hourly_rate { 1.5 }
  end
end
 