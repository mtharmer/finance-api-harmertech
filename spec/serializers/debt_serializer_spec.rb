require 'rails_helper'

RSpec.describe DebtSerializer do
  let(:debt) { build(:debt) }
  let(:serialized) { DebtSerializer.new(debt).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes the expected attributes' do
    expect(attributes['name']).to eq(debt.name)
    expect(attributes['originalBalance']).to eq(debt.original_balance.as_json)
    expect(attributes['currentBalance']).to eq(debt.current_balance.as_json)
    expect(attributes['apr']).to eq(debt.apr.as_json)
    expect(attributes['originalTerm']).to eq(debt.original_term.as_json)
    expect(attributes['minimumPayment']).to eq(debt.minimum_payment.as_json)
  end
end
