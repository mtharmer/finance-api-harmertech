# frozen_string_literal: true

FactoryBot.define do
  factory :debt do
    name { Faker::Company.name }
    original_balance { 19_546.02 }
    current_balance { 17_899.37 }
    apr { 13.34 }
    original_term { 72 }
    minimum_payment { 397.94 }
    user
  end
end
