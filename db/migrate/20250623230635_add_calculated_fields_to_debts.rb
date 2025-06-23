class AddCalculatedFieldsToDebts < ActiveRecord::Migration[7.1]
  def change
    add_column :debts, :original_interest, :decimal, precision: 10, scale: 2
    add_column :debts, :remaining_interest, :decimal, precision: 10, scale: 2
    add_column :debts, :remaining_term, :integer
    add_column :debts, :principal_paid, :decimal, precision: 10, scale: 2
  end
end
