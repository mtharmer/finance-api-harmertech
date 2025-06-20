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
end
