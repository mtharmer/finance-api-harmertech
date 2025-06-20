# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DebtSerializer do
  let(:debt) { build(:debt) }
  let(:serialized) { described_class.new(debt).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes name' do
    expect(attributes['name']).to eq(debt.name)
  end

  it 'includes originalBalance' do
    expect(attributes['originalBalance']).to eq(debt.original_balance.as_json)
  end

  it 'includes currentBalance' do
    expect(attributes['currentBalance']).to eq(debt.current_balance.as_json)
  end

  it 'includes apr' do
    expect(attributes['apr']).to eq(debt.apr.as_json)
  end

  it 'includes originalTerm' do
    expect(attributes['originalTerm']).to eq(debt.original_term.as_json)
  end

  it 'includes minimumPayment' do
    expect(attributes['minimumPayment']).to eq(debt.minimum_payment.as_json)
  end
end
