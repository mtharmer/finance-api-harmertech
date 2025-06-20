class MonthlyExpense < ApplicationRecord
  belongs_to :user

  validates_presence_of %i[name amount]
end
