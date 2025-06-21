# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonthlyExpenseSerializer do
  let(:monthly_expense) { build(:monthly_expense) }
  let(:serialized) { described_class.new(monthly_expense).serializable_hash.as_json }
  let(:attributes) { serialized.dig('data', 'attributes') }

  it 'includes id' do
    expect(attributes['id']).to eq(monthly_expense.id)
  end

  it 'includes name' do
    expect(attributes['name']).to eq(monthly_expense.name)
  end

  it 'includes originalBalance' do
    expect(attributes['amount']).to eq(monthly_expense.amount.as_json)
  end

  it 'includes currentBalance' do
    expect(attributes['expenseType']).to eq(monthly_expense.expense_type.as_json)
  end

  it 'includes apr' do
    expect(attributes['dueDay']).to eq(monthly_expense.due_day.as_json)
  end
end
