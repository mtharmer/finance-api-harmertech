module LoanCalculator
  class Payments
    attr_reader :result

    def initialize(rate, balance, payment)
      @rate = rate / 100.0
      @balance = balance
      @payment = payment
      @result = calculate()
    end

    def calculate(current_balance = @balance, term = 0)
      if (current_balance <= 0)
        return term
      end

      interest = (current_balance * (1 + @rate / 12)).round(2) - current_balance
      principal = @payment - interest
      return calculate(current_balance - principal, term + 1)
    end
  end
end
