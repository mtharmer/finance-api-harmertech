# frozen_string_literal: true

class Mortgage < ApplicationRecord
  belongs_to :user

  validates :original_balance, :current_balance, :apr, :term, :payment, presence: true

  before_save :calculate

  def calculate
    self.original_balance_after_down_payment = original_balance - down_payment
    calculate_remaining_term
    calculate_original_interest
    calculate_remaining_interest
  end

  def calculate_remaining_term
    self.remaining_term = LoanCalculator::Payments.new(apr, current_balance, payment).result
    self.remaining_term_after_extra = LoanCalculator::Payments.new(apr, current_balance, payment + extra_payment).result
  end

  def calculate_original_interest
    self.original_interest = LoanCalculator::Interest.new(apr, original_balance_after_down_payment, payment,
                                                          term).result
    self.original_interest_after_extra = LoanCalculator::Interest.new(apr, original_balance_after_down_payment,
                                                                      payment + extra_payment, term).result
  end

  def calculate_remaining_interest
    self.remaining_interest = LoanCalculator::Interest.new(apr, current_balance, payment,
                                                           remaining_term).result
    self.remaining_interest_after_extra = LoanCalculator::Interest.new(apr, current_balance, payment + extra_payment,
                                                                       remaining_term_after_extra).result
  end
end
