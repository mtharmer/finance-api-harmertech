# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DebtSerializer do
  let(:debt) { create(:debt) }
  let(:serialized) { described_class.new(debt).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes id' do
    expect(attributes['id']).to eq(debt.id)
  end

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

  it 'includes principalPaid' do
    expect(attributes['principalPaid']).to eq(debt.principal_paid.as_json)
  end

  it 'includes remainingTerm' do
    expect(attributes['remainingTerm']).to eq(debt.remaining_term.as_json)
  end

  it 'includes originalInterest' do
    expect(attributes['originalInterest']).to eq(debt.original_interest.as_json)
  end

  it 'includes remainingInterest' do
    expect(attributes['remainingInterest']).to eq(debt.remaining_interest.as_json)
  end
end
