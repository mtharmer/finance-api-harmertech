# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MortgageSerializer do
  let(:mortgage) { build(:mortgage) }
  let(:serialized) { described_class.new(mortgage).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes id' do
    expect(attributes['id']).to eq(mortgage.id)
  end

  it 'includes original balance' do
    expect(attributes['originalBalance']).to eq(mortgage.original_balance.as_json)
  end

  it 'includes down payment' do
    expect(attributes['downPayment']).to eq(mortgage.down_payment.as_json)
  end

  it 'includes original balance after down payment' do
    expect(attributes['originalBalanceAfterDownPayment']).to eq(mortgage.original_balance_after_down_payment.as_json)
  end

  it 'includes current balance' do
    expect(attributes['currentBalance']).to eq(mortgage.current_balance.as_json)
  end

  it 'includes apr' do
    expect(attributes['apr']).to eq(mortgage.apr.as_json)
  end

  it 'includes term' do
    expect(attributes['term']).to eq(mortgage.term)
  end

  it 'includes payment' do
    expect(attributes['payment']).to eq(mortgage.payment.as_json)
  end

  it 'includes tax' do
    expect(attributes['tax']).to eq(mortgage.tax.as_json)
  end

  it 'includes insurance' do
    expect(attributes['insurance']).to eq(mortgage.insurance.as_json)
  end

  it 'includes pmi' do
    expect(attributes['pmi']).to eq(mortgage.pmi.as_json)
  end

  it 'includes extra payment' do
    expect(attributes['extraPayment']).to eq(mortgage.extra_payment.as_json)
  end

  it 'includes original interest' do
    expect(attributes['originalInterest']).to eq(mortgage.original_interest.as_json)
  end

  it 'includes remaining interest' do
    expect(attributes['remainingInterest']).to eq(mortgage.remaining_interest.as_json)
  end

  it 'includes remaining term' do
    expect(attributes['remainingTerm']).to eq(mortgage.remaining_term.as_json)
  end

  it 'includes original interest after extra' do
    expect(attributes['originalInterestAfterExtra']).to eq(mortgage.original_interest_after_extra.as_json)
  end

  it 'includes remaining interest after extra' do
    expect(attributes['remainingInterestAfterExtra']).to eq(mortgage.remaining_interest_after_extra.as_json)
  end

  it 'includes remaining term after extra' do
    expect(attributes['remainingTermAfterExtra']).to eq(mortgage.remaining_term_after_extra.as_json)
  end
end
