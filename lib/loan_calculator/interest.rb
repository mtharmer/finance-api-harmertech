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
      if term <= 0 || balance <= 0
        return interest
      end

      cur_interest = (balance * (1 + @rate / 12)).round(2) - balance
      interest += cur_interest
      balance -= @payment - cur_interest

      calculate(balance, term - 1, interest)
    end
  end
end
