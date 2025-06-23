# frozen_string_literal: true

FactoryBot.define do
  factory :monthly_expense do
    name { Faker::Company.name }
    amount { Faker::Number.between(from: 0.0, to: 2000.0).round(2) }
    expense_type { 'Bill' }
    due_day { Faker::Number.between(from: 0, to: 31) }
    user
  end
end
