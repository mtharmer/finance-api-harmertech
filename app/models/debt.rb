# frozen_string_literal: true

class Debt < ApplicationRecord
  # include LoanCalculator
  belongs_to :user
  validates :name, :original_balance, :apr, :original_term, :minimum_payment, presence: true

  before_save :calculate

  def calculate
    self.principal_paid = original_balance - current_balance
    calculate_remaining_term
    calculate_original_interest
    calculate_remaining_interest
  end

  def calculate_remaining_term
    self.remaining_term = LoanCalculator::Payments.new(apr, current_balance, minimum_payment).result
  end

  def calculate_original_interest
    self.original_interest = LoanCalculator::Interest.new(apr, original_balance, minimum_payment,
                                                          original_term).result
  end

  def calculate_remaining_interest
    self.remaining_interest = LoanCalculator::Interest.new(apr, current_balance, minimum_payment,
                                                           remaining_term).result
  end
end
