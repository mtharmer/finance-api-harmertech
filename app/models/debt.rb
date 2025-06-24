# frozen_string_literal: true

class Debt < ApplicationRecord
  # include LoanCalculator
  belongs_to :user
  validates :name, :original_balance, :apr, :original_term, :minimum_payment, presence: true

  before_save :calculate

  def calculate
    self.principal_paid = self.original_balance - self.current_balance
    self.remaining_term = LoanCalculator::Payments.new(self.apr, self.current_balance, self.minimum_payment).result
    self.original_interest = LoanCalculator::Interest.new(self.apr, self.original_balance, self.minimum_payment, self.original_term).result
    self.remaining_interest = LoanCalculator::Interest.new(self.apr, self.current_balance, self.minimum_payment, self.remaining_term).result
  end
end
