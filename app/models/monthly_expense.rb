# frozen_string_literal: true

class MonthlyExpense < ApplicationRecord
  belongs_to :user

  validates :name, :amount, presence: true
end
