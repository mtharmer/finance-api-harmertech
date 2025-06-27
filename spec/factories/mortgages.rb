# frozen_string_literal: true

FactoryBot.define do
  factory :mortgage do
    original_balance { 356_521.67 }
    current_balance { 315_417.58 }
    apr { 6.655 }
    term { 360 }
    payment { 2_289.92 }
    tax { 581.23 }
    insurance { 80.42 }
    pmi { 0 }
    extra_payment { 0 }
    user

    trait :with_down_payment do
      down_payment { 35_000 }
    end

    trait :with_pmi do
      pmi { 54.27 }
    end

    trait :with_extra_payment do
      extra_payment { 200.00 }
    end
  end
end
