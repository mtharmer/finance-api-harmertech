# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoanCalculator::Interest do
  describe 'calculating loan interest' do
    it 'returns 0 if payment is 0' do
      result = described_class.new(3.5, 3000, 0, 36).result
      expect(result).to eq(0)
    end

    it 'returns 0 if term is 0' do
      result = described_class.new(3.5, 3000, 100, 0).result
      expect(result).to eq(0)
    end

    it 'returns 0 if balance is 0' do
      result = described_class.new(3.5, 0, 100, 36).result
      expect(result).to eq(0)
    end

    it 'returns the expected interest' do
      result = described_class.new(13.34, 17_899.37, 397.94, 63).result
      expect(result).to eq(7053.16)
    end
  end
end
