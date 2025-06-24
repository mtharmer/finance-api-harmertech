# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debt, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:original_balance) }
    it { is_expected.to validate_presence_of(:apr) }
    it { is_expected.to validate_presence_of(:original_term) }
    it { is_expected.to validate_presence_of(:minimum_payment) }
  end

  describe 'building' do
    it 'can build without error' do
      debt = build(:debt, name: 'Some Company')
      expect(debt.name).to eq('Some Company')
    end
  end

  describe 'creating' do
    it 'calculates paid principal' do
      debt = create(:debt)
      expect(debt.principal_paid).to eq(1646.65)
    end

    it 'calculates remaining term' do
      debt = create(:debt)
      expect(debt.remaining_term).to eq(63)
    end

    it 'calculates original interest' do
      debt = create(:debt)
      expect(debt.original_interest).to eq(8880.74)
    end

    it 'calculates remaining interest' do
      debt = create(:debt)
      expect(debt.remaining_interest).to eq(7053.16)
    end
  end
end
