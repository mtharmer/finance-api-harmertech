# frozen_string_literal: true

module LoanCalculator
  class Payments
    attr_reader :result

    def initialize(rate, balance, payment)
      @rate = rate / 100.0
      @balance = balance
      @payment = payment
      @result = calculate
    end

    def calculate(current_balance = @balance, term = 0)
      return 0 if @payment <= 0
      return term if current_balance <= 0

      interest = (current_balance * (1 + (@rate / 12))).round(2) - current_balance
      current_balance -= [current_balance, @payment - interest].min
      calculate(current_balance, term + 1)
    end
  end
end
