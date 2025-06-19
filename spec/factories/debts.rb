FactoryBot.define do
  factory :debt do
    name { Faker::Company.name }
    original_balance { Faker::Number.between(from: 5000.0, to: 10000.0).round(2) }
    current_balance { Faker::Number.between(from: 0.0, to: 4999.9).round(2) }
    apr { Faker::Number.between(from: 0.0, to: 99.9).round(3) }
    original_term { Faker::Number.between(from: 1, to: 360) }
    minimum_payment { Faker::Number.between(from: 0.0, to: 1000.0).round(2) }
    association :user
  end
end
