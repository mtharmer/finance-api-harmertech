# frozen_string_literal: true

module LoanCalculator
  class Interest
    attr_reader :result

    def initialize(rate, balance, payment, term)
      @rate = rate / 100.0
      @balance = balance
      @term = term
      @payment = payment
      @result = calculate(@balance, @term)
    end

    def calculate(balance, term, interest = 0)
      return 0 if @payment <= 0
      return interest.round(2) if term <= 0 || balance <= 0

      cur_interest = (balance * (1 + (@rate / 12))).round(2) - balance
      interest += cur_interest
      balance -= [balance, @payment - cur_interest].min

      calculate(balance, term - 1, interest)
    end
  end
end
