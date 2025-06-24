# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoanCalculator::Payments do
  describe 'calculating loan term' do
    it 'returns 0 if balance is missing' do
      result = described_class.new(3.5, 0, 300).result
      expect(result).to eq(0)
    end

    it 'returns 0 if payment is missing' do
      result = described_class.new(3.5, 5000, 0).result
      expect(result).to eq(0)
    end

    it 'returns the expected calculation' do
      result = described_class.new(13.34, 17_899.37, 397.94).result
      expect(result).to eq(63)
    end
  end
end
